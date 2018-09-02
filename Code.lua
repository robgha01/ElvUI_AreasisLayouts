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

--This function will hold your layout settings
local function SetupLayout(layout)
	--[[
	--	PUT YOUR EXPORTED PROFILE/SETTINGS BELOW HERE
	--]]
	
	--LAYOUT GOES HERE
	-- Profile
	E.db["currentTutorial"] = 2;
	E.db["general"]["vendorGrays"] = true;
	E.db["general"]["minimap"]["locationFont"] = "Friz Quadrata TT";
	E.db["general"]["minimap"]["buttons"]["mouseover"] = true;
	E.db["general"]["minimap"]["size"] = 210;
	E.db["general"]["font"] = "Friz Quadrata TT";
	E.db["general"]["bottomPanel"] = false;
	E.db["general"]["reminder"]["enable"] = false;
	E.db["general"]["reminder"]["font"] = "Friz Quadrata TT";
	E.db["enhanced"]["general"]["autoRepChange"] = true;
	E.db["enhanced"]["general"]["pvpAutoRelease"] = true;
	E.db["enhanced"]["general"]["declineduel"] = true;
	E.db["enhanced"]["loseControl"]["enable"] = true;
	E.db["enhanced"]["chat"]["dpsLinks"] = true;
	E.db["enhanced"]["equipment"]["enable"] = true;
	E.db["enhanced"]["equipment"]["itemlevel"]["enable"] = true;
	E.db["enhanced"]["watchframe"]["enable"] = true;
	E.db["enhanced"]["interruptTracker"]["enable"] = false;
	E.db["bags"]["countFontSize"] = 14;
	E.db["bags"]["countFont"] = "Friz Quadrata TT";
	E.db["bags"]["itemLevelFont"] = "Friz Quadrata TT";
	E.db["bags"]["itemLevelFontSize"] = 14;
	E.db["bags"]["bagSize"] = 40;
	E.db["bags"]["bankSize"] = 40;
	E.db["hideTutorial"] = 1;
	E.db["auras"]["fontSize"] = 14;
	E.db["auras"]["font"] = "Friz Quadrata TT";
	E.db["locplus"]["lpfontsize"] = 14;
	E.db["locplus"]["dig"] = false;
	E.db["locplus"]["hidecoords"] = true;
	E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-143,248";
	E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,424,948";
	E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,5";
	E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,6,737";
	E.db["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-575,168";
	E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-24";
	E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,240,-248";
	E.db["movers"]["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-60,5";
	E.db["movers"]["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,143,206";
	E.db["movers"]["ElvBar_Pet"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4";
	E.db["movers"]["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,391,769";
	E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-186,35";
	E.db["movers"]["LoseControlMover"] = "TOP,ElvUIParent,TOP,0,-573";
	E.db["movers"]["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-234";
	E.db["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,245,151";
	E.db["movers"]["ReputationBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-60,97";
	E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,143,248";
	E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,186,35";
	E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,238,981";
	E.db["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-52,-413";
	E.db["movers"]["ShiftAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,933,127";
	E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,324";
	E.db["movers"]["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,515,2";
	E.db["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,196,442";
	E.db["movers"]["WatchFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,256,-63";
	E.db["movers"]["PvPMover"] = "TOP,ElvUIParent,TOP,0,-33";
	E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-143,206";
	E.db["movers"]["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,644,168";
	E.db["movers"]["ElvAB_5"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,260";
	E.db["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,6,487";
	E.db["movers"]["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-334,-181";
	E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,557,4";
	E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,261,942";
	E.db["tooltip"]["textFontSize"] = 14;
	E.db["tooltip"]["font"] = "Friz Quadrata TT";
	E.db["tooltip"]["healthBar"]["font"] = "Friz Quadrata TT";
	E.db["tooltip"]["fontSize"] = 14;
	E.db["tooltip"]["smallTextFontSize"] = 14;
	E.db["tooltip"]["headerFontSize"] = 14;
	E.db["databars"]["experience"]["textFont"] = "ABF";
	E.db["databars"]["experience"]["textFormat"] = "PERCENT";
	E.db["databars"]["experience"]["width"] = 580;
	E.db["databars"]["experience"]["height"] = 28;
	E.db["databars"]["experience"]["orientation"] = "HORIZONTAL";
	E.db["databars"]["experience"]["textSize"] = 21;
	E.db["databars"]["experience"]["textOutline"] = "NONE";
	E.db["databars"]["reputation"]["textFormat"] = "PERCENT";
	E.db["databars"]["reputation"]["orientation"] = "HORIZONTAL";
	E.db["databars"]["reputation"]["textSize"] = 21;
	E.db["databars"]["reputation"]["enable"] = true;
	E.db["databars"]["reputation"]["height"] = 28;
	E.db["databars"]["reputation"]["mouseover"] = true;
	E.db["databars"]["reputation"]["width"] = 580;
	E.db["unitframe"]["font"] = "Expressway";
	E.db["unitframe"]["colors"]["health"]["r"] = 0.15294117647059;
	E.db["unitframe"]["colors"]["health"]["g"] = 0.15294117647059;
	E.db["unitframe"]["colors"]["health"]["b"] = 0.15294117647059;
	E.db["unitframe"]["fontOutline"] = "NONE";
	E.db["unitframe"]["smoothbars"] = true;
	E.db["unitframe"]["fontSize"] = 14;
	E.db["unitframe"]["units"]["pet"]["castbar"]["height"] = 16;
	E.db["unitframe"]["units"]["pet"]["health"]["attachTextTo"] = "Health";
	E.db["unitframe"]["units"]["pet"]["health"]["xOffset"] = 2;
	E.db["unitframe"]["units"]["pet"]["health"]["text_format"] = "[healthcolor][health:current]";
	E.db["unitframe"]["units"]["pet"]["health"]["position"] = "LEFT";
	E.db["unitframe"]["units"]["pet"]["power"]["xOffset"] = -2;
	E.db["unitframe"]["units"]["pet"]["power"]["attachTextTo"] = "Health";
	E.db["unitframe"]["units"]["pet"]["power"]["text_format"] = "[powercolor][power:current]";
	E.db["unitframe"]["units"]["pet"]["power"]["position"] = "RIGHT";
	E.db["unitframe"]["units"]["pet"]["name"]["attachTextTo"] = "Health";
	E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false;
	E.db["unitframe"]["units"]["targettarget"]["width"] = 135;
	E.db["unitframe"]["units"]["targettarget"]["height"] = 35;
	E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = true;
	E.db["unitframe"]["units"]["target"]["height"] = 41;
	E.db["unitframe"]["units"]["target"]["aurabar"]["maxBars"] = 5;
	E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false;
	E.db["unitframe"]["units"]["player"]["debuffs"]["enable"] = false;
	E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] = true;
	E.db["unitframe"]["units"]["player"]["portrait"]["width"] = 150;
	E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false;
	E.db["unitframe"]["units"]["player"]["aurabar"]["height"] = 33;
	E.db["unitframe"]["units"]["player"]["combatfade"] = true;
	E.db["unitframe"]["units"]["player"]["height"] = 41;
	E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["font"] = "Friz Quadrata TT";
	E.db["unitframe"]["units"]["raid"]["enable"] = false;
	E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Friz Quadrata TT";
	E.db["datatexts"]["fontSize"] = 14;
	E.db["datatexts"]["font"] = "Friz Quadrata TT";
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["right"] = "System";
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["left"] = "Bags";
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["middle"] = "Gold";
	E.db["datatexts"]["rightChatPanel"] = false;
	E.db["actionbar"]["bar3"]["mouseover"] = true;
	E.db["actionbar"]["bar3"]["alpha"] = 0.65;
	E.db["actionbar"]["bar3"]["buttonsize"] = 42;
	E.db["actionbar"]["bar3"]["backdrop"] = true;
	E.db["actionbar"]["bar6"]["buttons"] = 3;
	E.db["actionbar"]["bar6"]["buttonspacing"] = 1;
	E.db["actionbar"]["bar6"]["buttonsize"] = 60;
	E.db["actionbar"]["bar6"]["alpha"] = 0.22;
	E.db["actionbar"]["desaturateOnCooldown"] = true;
	E.db["actionbar"]["bar2"]["enabled"] = true;
	E.db["actionbar"]["bar2"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["bar2"]["buttons"] = 6;
	E.db["actionbar"]["bar2"]["buttonsize"] = 60;
	E.db["actionbar"]["bar2"]["showGrid"] = false;
	E.db["actionbar"]["bar1"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["bar1"]["buttons"] = 6;
	E.db["actionbar"]["bar1"]["buttonsize"] = 60;
	E.db["actionbar"]["bar1"]["showGrid"] = false;
	E.db["actionbar"]["bar5"]["enabled"] = false;
	E.db["actionbar"]["bar5"]["buttons"] = 12;
	E.db["actionbar"]["bar5"]["showGrid"] = false;
	E.db["actionbar"]["bar5"]["buttonsPerRow"] = 12;
	E.db["actionbar"]["bar5"]["buttonsize"] = 60;
	E.db["actionbar"]["lockActionBars"] = false;
	E.db["actionbar"]["globalFadeAlpha"] = 0.75;
	E.db["actionbar"]["barPet"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["barPet"]["backdrop"] = false;
	E.db["actionbar"]["barPet"]["buttonsize"] = 40;
	E.db["actionbar"]["font"] = "Friz Quadrata TT";
	E.db["actionbar"]["barShapeShift"]["buttonsize"] = 48;
	E.db["actionbar"]["barShapeShift"]["mouseover"] = true;
	E.db["actionbar"]["barShapeShift"]["point"] = "BOTTOMLEFT";
	E.db["actionbar"]["bar4"]["mouseover"] = true;
	E.db["actionbar"]["bar4"]["backdrop"] = false;
	E.db["actionbar"]["bar4"]["showGrid"] = false;
	E.db["nameplates"]["font"] = "Friz Quadrata TT";
	E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["enable"] = true;
	E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["size"] = 39;
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["baseHeight"] = 32;
	E.db["chat"]["fontSize"] = 14;
	E.db["chat"]["font"] = "Friz Quadrata TT";
	E.db["chat"]["panelBackdrop"] = "LEFT";
	E.db["chat"]["panelHeight"] = 146;
	E.db["chat"]["tabFont"] = "Friz Quadrata TT";
	E.db["chat"]["tapFontSize"] = 14;
	E.db["chat"]["panelWidth"] = 510;

	-- Private
	E.private["general"]["selectQuestReward"] = true;
	E.private["general"]["loot"] = false;
	E.private["tooltip"]["enable"] = false;
	E.private["actionbar"]["lbf"]["enable"] = true;
	E.private["theme"] = "class";
	E.private["install_complete"] = "5.41";

	-- Global
	-- E.global["sle"]["advanced"]["cyrillics"]["commands"] = true;
	-- E.global["sle"]["advanced"]["optionsLimits"] = true;
	-- E.global["sle"]["advanced"]["confirmed"] = true;
	E.global["uiScale"] = "0.64";
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["texture"]["enable"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["texture"]["texture"] = "ElvUI Norm";
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["hide"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["health"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["borderColor"]["a"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["borderColor"]["b"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["borderColor"]["g"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["borderColor"]["r"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["nameColor"]["a"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["nameColor"]["b"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["nameColor"]["g"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["nameColor"]["r"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["healthColor"]["a"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["healthColor"]["b"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["healthColor"]["g"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["healthColor"]["r"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["border"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["color"]["name"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["nameOnly"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["alpha"] = -1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["flash"]["color"]["a"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["flash"]["color"]["b"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["flash"]["color"]["g"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["flash"]["color"]["r"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["flash"]["enable"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["actions"]["flash"]["speed"] = 4;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["debuffs"]["minTimeLeft"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["debuffs"]["mustHaveAll"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["debuffs"]["missing"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["debuffs"]["maxTimeLeft"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceType"]["party"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceType"]["pvp"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceType"]["raid"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceType"]["arena"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceType"]["none"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["healthThreshold"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["role"]["tank"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["role"]["damager"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["role"]["healer"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["isTarget"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["priority"] = 1;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["outOfCombat"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["healthUsePlayer"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["maxlevel"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["overHealthThreshold"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["nameplateType"]["enemyPlayer"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["nameplateType"]["friendlyPlayer"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["nameplateType"]["friendlyNPC"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["minlevel"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["casting"]["interruptible"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["reactionType"]["neutral"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["reactionType"]["hostile"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["reactionType"]["friendly"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["reactionType"]["enabled"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["powerThreshold"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["underHealthThreshold"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["overPowerThreshold"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["underPowerThreshold"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceDifficulty"]["dungeon"]["normal"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceDifficulty"]["dungeon"]["heroic"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceDifficulty"]["raid"]["normal"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["instanceDifficulty"]["raid"]["heroic"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["cooldowns"]["mustHaveAll"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["buffs"]["minTimeLeft"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["buffs"]["mustHaveAll"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["buffs"]["missing"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["buffs"]["maxTimeLeft"] = 0;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["notTarget"] = false;
	-- E.global["nameplates"]["filters"]["Boss"]["triggers"]["inCombat"] = false;
	E.global["userInformedNewChanges1"] = true;
	E.global["general"]["fadeMapWhenMoving"] = false;
	E.global["general"]["minUiScale"] = 0.5;
	E.global["general"]["animateConfig"] = false;
	E.global["general"]["autoScale"] = false;
	E.global["general"]["commandBarSetting"] = "DISABLED";



	--[[
		--If you want to modify the base layout according to
		-- certain conditions then this is how you could do it
		if layout == "tank" then
			--Make some changes to the layout posted above
		elseif layout == "dps" then
			--Make some other changes
		elseif layout == "healer" then
			--Make some different changes
		end
	--]]


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
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() SetupLayout("dps") end)
			PluginInstallFrame.Option2:SetText("Install Layout")
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