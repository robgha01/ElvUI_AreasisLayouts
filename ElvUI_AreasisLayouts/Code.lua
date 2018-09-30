local AceAddon = LibStub("AceAddon-3.0")
local AceGUI = LibStub("AceGUI-3.0")
--Don't worry about this
local addon, ns = ...
local Version = GetAddOnMetadata(addon, "Version")

--Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic

-- These are things we do not cache
-- GLOBALS: PluginInstallStepComplete, PluginInstallFrame

--Change this line and use a unique name for your plugin.
local MyPluginName = "Areasis Layouts"

--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

--Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

--Create a new ElvUI module so ElvUI can handle initialization when ready
local mod = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

mod.layouts = {}
mod.modules = {
	["Quartz3"] = { enabled = true, addon = function() return AceAddon:GetAddon("Quartz3",true) or nil end },
	["MistrasDiabloOrbs"] = { enabled = true, addon = function() return D32CharacterData or nil end },
	["ShadowedUnitFrames"] = { enabled = true, addon = function() return ShadowUF or nil end },
}

local uniquealyzer = 1;
local function createCheckbutton(displayname)
	uniquealyzer = uniquealyzer + 1;
	
	local checkbutton = CreateFrame("CheckButton", MyPluginName.."CheckButton0" .. uniquealyzer, PluginInstallFrame, "ChatConfigCheckButtonTemplate");
	getglobal(checkbutton:GetName() .. 'Text'):SetText(displayname);

	return checkbutton;
end

--This function will hold your layout settings
local function SetupLayout(layout)
	--[[
	--	PUT YOUR EXPORTED PROFILE/SETTINGS BELOW HERE
	--]]
	
	--LAYOUT GOES HERE
	
	--If you want to modify the base layout according to
	-- certain conditions then this is how you could do it
	-- if layout == "Basic" then
	-- 	BasicLayout()
	-- elseif layout == "Diablo" then
	-- 	DiabloLayout()
	-- end
	
	local layoutInstaller = mod.layouts[layout]
	layoutInstaller["ElvUI"]()

	for k,v in pairs(mod.modules) do
		if v.addon() and layoutInstaller[k] then
			layoutInstaller[k](v.addon())
		end
	end
	
	--[[
	--	This section at the bottom is just to update ElvUI and display a message
	--]]
	--Update ElvUI
	E:UpdateAll(true)
	--Show message about layout being set
	PluginInstallStepComplete.message = "Layout Set"
	PluginInstallStepComplete:Show()
end

--This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	--Set a variable tracking the version of the addon when layout was installed
	E.db[MyPluginName].install_version = Version

	ReloadUI()
end

--This is the data we pass on to the ElvUI Plugin Installer.
--The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
	Title = format("|cff4beb2c%s %s|r", MyPluginName, "Installation"),
	Name = MyPluginName,
	--tutorialImage = "Interface\\AddOns\\MyAddOn\\logo.tga", --If you have a logo you want to use, otherwise it uses the one from ElvUI
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s inspired by Lyffe's clean ui.", MyPluginName)
			PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and apply settings to your current ElvUI profile and any supported addon. If you want to be able to go back to your original settings then create a new profile before going through this installation process.")
			PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip Process")
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("Layouts")
			PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.\nTo see the installed layout you need to finish the installation.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")

			-- local lastCheckControl = PluginInstallFrame
			-- local lastCheckControlX = 25
			-- for k,v in pairs(mod.modules) do
			-- 	if v.addon() then
			-- 		local enableBtn = createCheckbutton(k)
			-- 		local textW = getglobal(enableBtn:GetName() .. 'Text'):GetStringWidth()
			-- 		enableBtn:ClearAllPoints()
			-- 		enableBtn:Point("CENTER", lastCheckControl, "LEFT", lastCheckControlX, 0)
			-- 		enableBtn:Show()
			-- 		enableBtn:SetScript("OnClick", function() v.enabled = not v.enabled end)
			-- 		enableBtn:SetChecked(true)
			-- 		E.Skins:HandleCheckBox(enableBtn, true)				
			-- 		lastCheckControl = enableBtn
			-- 		lastCheckControlX = lastCheckControlX + textW + 25
			-- 	end
			-- end

			local index = 2
			for layoutName,v in pairs(mod.layouts) do
				local optFrame = PluginInstallFrame["Option"..index]
				optFrame:Show()
				optFrame:SetScript("OnClick", function() SetupLayout(layoutName) end)
				optFrame:SetText(layoutName.." Layout")
				index = index + 1
			end	
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "Layouts",
		[3] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}



--This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args.MyPluginName = {
		order = 100,
		type = "group",
		name = format("|cff4beb2c%s|r", MyPluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = MyPluginName,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", MyPluginName),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleConfig(); end,
			},
			spacer3 = {
				order = 7,
				type = "description",
				name = " ",
			},
			export = {
				order = 8,
				type = "execute",
				name = "Export",
				desc = "Exports supported addons for use with layout building. (For ElvUI use build in export with PluginFormat)\n\nThis may take some time and freeze your ui while working",
				func = function()
					if D32Textures then
						mod:QueueTable(D32CharacterData, "D32CharacterData")
						mod:QueueTable(D32Textures, "D32Textures")
					end

					local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3",true)
					if Quartz3 then
						mod:QueueTable(Quartz3.db.profile, "Quartz3.db.profile")
						mod:QueueTable(Quartz3.db.children.Buff.profile, "Quartz3.db.children.Buff.profile")
						mod:QueueTable(Quartz3.db.children.Flight.profile, "Quartz3.db.children.Flight.profile")
						mod:QueueTable(Quartz3.db.children.Focus.profile, "Quartz3.db.children.Focus.profile")
						mod:QueueTable(Quartz3.db.children.GCD.profile, "Quartz3.db.children.GCD.profile")
						mod:QueueTable(Quartz3.db.children.Interrupt.profile, "Quartz3.db.children.Interrupt.profile")
						mod:QueueTable(Quartz3.db.children.Latency.profile, "Quartz3.db.children.Latency.profile")
						mod:QueueTable(Quartz3.db.children.Mirror.profile, "Quartz3.db.children.Mirror.profile")
						mod:QueueTable(Quartz3.db.children.Pet.profile, "Quartz3.db.children.Pet.profile")
						mod:QueueTable(Quartz3.db.children.Player.profile, "Quartz3.db.children.Player.profile")
						mod:QueueTable(Quartz3.db.children.Range.profile, "Quartz3.db.children.Range.profile")
						mod:QueueTable(Quartz3.db.children.Swing.profile, "Quartz3.db.children.Swing.profile")
						mod:QueueTable(Quartz3.db.children.Target.profile, "Quartz3.db.children.Target.profile")
					end

					if ShadowUF then
						mod:QueueTable(ShadowUF.db.profile, "ShadowUF.db.profile")
					end

					local frame = AceGUI:Create("Frame")
					frame:SetTitle("Export Data")
					frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
					frame:SetLayout("Flow")
					
					local editbox = AceGUI:Create("MultiLineEditBox")
					editbox:SetLabel("Data:")
					editbox:SetFullWidth(true)
					editbox:SetFullHeight(true)
					editbox:DisableButton(true)
					editbox:SetFocus()
					frame:AddChild(editbox)
					mod:ProcessQueue(function(r) editbox:SetText(r) end)
				end,
			},
		},
	}
end

--Create a unique table for our plugin
P[MyPluginName] = {}

--This function will handle initialization of the addon
function mod:Initialize()
	--Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end
	
	--Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

--This function will get called by ElvUI automatically when it is ready to initialize modules
local function CallbackInitialize()
	mod:Initialize()
end

--Register module with callback so it gets initialized when ready
E:RegisterModule(MyPluginName, CallbackInitialize)

function mod:RegisterLayout(layoutName, addonName, callbackInstall)
	if mod.layouts[layoutName] == nil then
		mod.layouts[layoutName] = {}
	end
	mod.layouts[layoutName][addonName] = callbackInstall
end