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

	local Quartz3 = AceAddon:GetAddon("Quartz3")
	if Quartz3 and layoutInstaller["Quartz3"] then
		layoutInstaller["Quartz3"](Quartz3)
	end

	-- if D32CharacterData then
	-- 	D32CharacterData.healthOrb.scale = 1.01		-- <= move this
	-- end
	
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
			PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and apply settings to your current ElvUI profile. If you want to be able to go back to your original settings then create a new profile before going through this installation process.")
			PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip Process")
			
			local index = 2
			for layoutName,v in pairs(mod.layouts) do
				local optFrame = PluginInstallFrame["Option"..index]
				optFrame:Show()
				optFrame:SetScript("OnClick", function() SetupLayout(layoutName) end)
				optFrame:SetText(layoutName.." Layout")
				index = index + 1
			end
			
			--PluginInstallFrame.Option2:Show()
			-- PluginInstallFrame.Option2:SetScript("OnClick", function() SetupLayout("BasicLayout") end)
			-- PluginInstallFrame.Option2:SetText("Basic Layout")
			-- PluginInstallFrame.Option3:Show()
			-- PluginInstallFrame.Option3:SetScript("OnClick", function() SetupLayout("DiabloLayout") end)
			-- PluginInstallFrame.Option3:SetText("Diablo Layout")
		end,
		[2] = function()
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

-- This exports addon save variables to a plugin format
local function profileTableToPluginFormat(tableRoot, inTable, setterFormat)
	local lineStructureTable = {};   
	local profileText = setterFormat;
	if(not profileText) then
	   return;
	end
	
	local returnString = "";
	local lineStructure = "";
	local sameLine = false;
	
	local function buildLineStructure()
	   local str = profileText;
	   for _, v in ipairs(lineStructureTable) do
		  if(type(v) == "string") then
			 str = str .. "[\"" .. v .. "\"]";
		  else
			 str = str .. "[" .. v .. "]";
		  end
	   end
	   
	   return str;
	end
	
	local function recurse(tbl)
	   lineStructure = buildLineStructure();
	   for k, v in pairs(tbl) do
		 if k ~= tableRoot and v ~= tableRoot then
			 if(not sameLine) then
				 returnString = returnString .. lineStructure;
			  end
			  
			  returnString = returnString .. "[";
			  
			  if(type(k) == "string") then
				 returnString = returnString.."\"" .. k .. "\"";
			  else
				 returnString = returnString .. k;
			  end
			  
			  if(type(v) == "table") then
				 tinsert(lineStructureTable, k);
				 sameLine = true;
				 returnString = returnString .. "]";
				 recurse(v);
			 else
				 sameLine = false;
				 returnString = returnString .. "] = ";
				 
				 if(type(v) == "number") then
				 returnString = returnString .. v .. ";\n";
				 elseif(type(v) == "string") then
				 returnString = returnString .. "\"" .. v:gsub("\\", "\\\\"):gsub("\n", "\\n"):gsub("\"", "\\\"") .. "\";\n";
				 elseif(type(v) == "boolean") then
				 if(v) then
					 returnString = returnString .. "true;\n";
				 else
					 returnString = returnString .. "false;\n";
				 end
				 else
					 returnString = returnString .. "\"" .. tostring(v) .. "\"\n";
				 end
			 end
		 end
	   end
	   
	   tremove(lineStructureTable);
	   lineStructure = buildLineStructure();
	end
	
	if(inTable and setterFormat) then
	   recurse(inTable);
	end
	
	return returnString	
 end

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
			export = {
				order = 7,
				type = "execute",
				name = "Export",
				desc = "Exports supported addons for use with layout building. (For ElvUI use build in export with PluginFormat)",
				func = function()
					local text = ""

					if D32Textures then
						text = profileTableToPluginFormat(D32CharacterData, D32CharacterData, "D32CharacterData")
						text = text..profileTableToPluginFormat(D32Textures, D32Textures, "D32Textures")
					end

					local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
					if Quartz3 then
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.profile, "Quartz3.db.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Buff.profile, "Quartz3.db.children.Buff.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Flight.profile, "Quartz3.db.children.Flight.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Focus.profile, "Quartz3.db.children.Focus.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.GCD.profile, "Quartz3.db.children.GCD.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Interrupt.profile, "Quartz3.db.children.Interrupt.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Latency.profile, "Quartz3.db.children.Latency.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Mirror.profile, "Quartz3.db.children.Mirror.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Pet.profile, "Quartz3.db.children.Pet.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Player.profile, "Quartz3.db.children.Player.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Range.profile, "Quartz3.db.children.Range.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Swing.profile, "Quartz3.db.children.Swing.profile")
						text = text..profileTableToPluginFormat(Quartz3, Quartz3.db.children.Target.profile, "Quartz3.db.children.Target.profile")
					end

					local frame = AceGUI:Create("Frame")
					frame:SetTitle("Export Data")
					frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
					frame:SetLayout("Flow")
					
					local editbox = AceGUI:Create("MultiLineEditBox")
					editbox:SetLabel("Data:")
					editbox:SetText(text)
					editbox:SetFullWidth(true)
					editbox:SetFullHeight(true)
					editbox:DisableButton(true)
					editbox:SetFocus()
					frame:AddChild(editbox)
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