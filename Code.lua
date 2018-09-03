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
	E.db["databars"]["experience"]["textFont"] = "ABF";
	E.db["databars"]["experience"]["textFormat"] = "PERCENT";
	E.db["databars"]["experience"]["width"] = 580;
	E.db["databars"]["experience"]["orientation"] = "HORIZONTAL";
	E.db["databars"]["experience"]["height"] = 28;
	E.db["databars"]["experience"]["textSize"] = 21;
	E.db["databars"]["experience"]["textOutline"] = "NONE";
	E.db["databars"]["reputation"]["textFormat"] = "PERCENT";
	E.db["databars"]["reputation"]["orientation"] = "HORIZONTAL";
	E.db["databars"]["reputation"]["textSize"] = 21;
	E.db["databars"]["reputation"]["enable"] = true;
	E.db["databars"]["reputation"]["height"] = 28;
	E.db["databars"]["reputation"]["mouseover"] = true;
	E.db["databars"]["reputation"]["width"] = 580;
	E.db["currentTutorial"] = 3;
	E.db["general"]["minimap"]["locationFont"] = "Friz Quadrata TT";
	E.db["general"]["minimap"]["buttons"]["buttonspacing"] = 0;
	E.db["general"]["minimap"]["buttons"]["mouseover"] = true;
	E.db["general"]["minimap"]["buttons"]["insideMinimap"]["xOffset"] = 0;
	E.db["general"]["minimap"]["buttons"]["insideMinimap"]["yOffset"] = 0;
	E.db["general"]["minimap"]["size"] = 210;
	E.db["general"]["decimalLength"] = 3;
	E.db["general"]["font"] = "Friz Quadrata TT";
	E.db["general"]["bottomPanel"] = false;
	E.db["general"]["valuecolor"]["a"] = 1;
	E.db["general"]["valuecolor"]["b"] = 0.04;
	E.db["general"]["valuecolor"]["g"] = 0.49;
	E.db["general"]["valuecolor"]["r"] = 1;
	E.db["general"]["reminder"]["enable"] = false;
	E.db["general"]["reminder"]["font"] = "Friz Quadrata TT";
	E.db["enhanced"]["general"]["autoRepChange"] = true;
	E.db["enhanced"]["general"]["pvpAutoRelease"] = true;
	E.db["enhanced"]["general"]["showQuestLevel"] = true;
	E.db["enhanced"]["general"]["declineduel"] = true;
	E.db["enhanced"]["general"]["trainAllButton"] = true;
	E.db["enhanced"]["character"]["player"]["orderName"] = "1,2,6,7,3,4,5";
	E.db["enhanced"]["character"]["player"]["collapsedName"]["RESISTANCE"] = true;
	E.db["enhanced"]["character"]["player"]["collapsedName"]["RANGED_COMBAT"] = true;
	E.db["enhanced"]["character"]["companionBackground"] = true;
	E.db["enhanced"]["loseControl"]["enable"] = true;
	E.db["enhanced"]["actionbars"]["transparentActionbars"]["transparentButtons"] = true;
	E.db["enhanced"]["actionbars"]["transparentActionbars"]["transparentBackdrops"] = true;
	E.db["enhanced"]["equipment"]["enable"] = true;
	E.db["enhanced"]["equipment"]["itemlevel"]["enable"] = true;
	E.db["enhanced"]["watchframe"]["city"] = "NONE";
	E.db["enhanced"]["watchframe"]["enable"] = true;
	E.db["enhanced"]["interruptTracker"]["enable"] = true;
	E.db["enhanced"]["chat"]["dpsLinks"] = true;
	E.db["Areasis Layouts"]["install_version"] = "1.00";
	E.db["hideTutorial"] = 1;
	E.db["chat"]["keywordSound"] = "NPCScan";
	E.db["chat"]["tabFont"] = "Friz Quadrata TT";
	E.db["chat"]["keywords"] = "invation";
	E.db["chat"]["font"] = "Friz Quadrata TT";
	E.db["chat"]["panelHeight"] = 146;
	E.db["chat"]["panelBackdrop"] = "LEFT";
	E.db["chat"]["fontSize"] = 14;
	E.db["chat"]["tapFontSize"] = 14;
	E.db["chat"]["panelWidth"] = 510;
	E.db["locplus"]["lpfontsize"] = 14;
	E.db["locplus"]["dig"] = false;
	E.db["locplus"]["hidecoords"] = true;
	E.db["VAT"]["threshold"]["buffsvalue"] = 10;
	E.db["VAT"]["threshold"]["buffs"] = true;
	E.db["abm"]["target"] = true;
	E.db["abm"]["player"] = true;
	E.db["abm"]["focusw"] = 169;
	E.db["CBO"]["player"]["overlay"] = false;
	E.db["CBO"]["focus"]["overlay"] = false;
	E.db["CBO"]["target"]["overlay"] = false;
	E.db["CBO"]["arena"]["overlay"] = false;
	E.db["CBO"]["pet"]["overlay"] = false;
	E.db["CBO"]["boss"]["overlay"] = false;
	E.db["movers"]["ElvUI_InterruptTrackerHeaderMover"] = "TOP,ElvUIParent,TOP,0,-490";
	E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-143,166";
	E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,430";
	E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,5";
	E.db["movers"]["MinimapButtonGrabberMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-56,440";
	E.db["movers"]["LocationMover"] = "TOP,ElvUIParent,TOP,0,-28";
	E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,6,737";
	E.db["movers"]["ElvUF_PlayerSwingBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,494,309";
	E.db["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-575,168";
	E.db["movers"]["ClassBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,495,331";
	E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-24";
	E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,240,-248";
	E.db["movers"]["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-60,5";
	E.db["movers"]["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,143,206";
	E.db["movers"]["ElvBar_Pet"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4";
	E.db["movers"]["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,320,814";
	E.db["movers"]["ElvUF_TargetAuraMover"] = "BOTTOM,ElvUIParent,BOTTOM,143,270";
	E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-186,35";
	E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,186,35";
	E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,557,4";
	E.db["movers"]["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-334,-181";
	E.db["movers"]["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-234";
	E.db["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,6,487";
	E.db["movers"]["ReputationBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-60,97";
	E.db["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,245,151";
	E.db["movers"]["ElvAB_5"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,260";
	E.db["movers"]["WatchFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,256,-63";
	E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-143,206";
	E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,193,769";
	E.db["movers"]["LoseControlMover"] = "TOP,ElvUIParent,TOP,0,-573";
	E.db["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-52,-413";
	E.db["movers"]["ShiftAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,933,127";
	E.db["movers"]["ElvUF_PlayerAuraMover"] = "BOTTOM,ElvUIParent,BOTTOM,-143,270";
	E.db["movers"]["ElvAB_9"] = "BOTTOM,ElvUIParent,BOTTOM,-94,414";
	E.db["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,196,442";
	E.db["movers"]["ElvAB_10"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,0";
	E.db["movers"]["PvPMover"] = "TOP,ElvUIParent,TOP,0,-33";
	E.db["movers"]["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,644,168";
	E.db["movers"]["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,515,2";
	E.db["movers"]["ElvAB_7"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-589,300";
	E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,292";
	E.db["movers"]["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-28";
	E.db["movers"]["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,155";
	E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,193,739";
	E.db["tooltip"]["textFontSize"] = 14;
	E.db["tooltip"]["font"] = "Friz Quadrata TT";
	E.db["tooltip"]["healthBar"]["font"] = "Friz Quadrata TT";
	E.db["tooltip"]["fontSize"] = 14;
	E.db["tooltip"]["smallTextFontSize"] = 14;
	E.db["tooltip"]["headerFontSize"] = 14;
	E.db["unitframe"]["fontSize"] = 14;
	E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.04;
	E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.49;
	E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 1;
	E.db["unitframe"]["colors"]["healthclass"] = true;
	E.db["unitframe"]["colors"]["castClassColor"] = true;
	E.db["unitframe"]["colors"]["health"]["b"] = 0.15294117647059;
	E.db["unitframe"]["colors"]["health"]["g"] = 0.15294117647059;
	E.db["unitframe"]["colors"]["health"]["r"] = 0.15294117647059;
	E.db["unitframe"]["fontOutline"] = "NONE";
	E.db["unitframe"]["smoothbars"] = true;
	E.db["unitframe"]["font"] = "Expressway";
	E.db["unitframe"]["units"]["pet"]["power"]["xOffset"] = -2;
	E.db["unitframe"]["units"]["pet"]["power"]["attachTextTo"] = "Health";
	E.db["unitframe"]["units"]["pet"]["power"]["text_format"] = "[powercolor][power:current]";
	E.db["unitframe"]["units"]["pet"]["power"]["position"] = "RIGHT";
	E.db["unitframe"]["units"]["pet"]["name"]["attachTextTo"] = "Health";
	E.db["unitframe"]["units"]["pet"]["name"]["yOffset"] = 16;
	E.db["unitframe"]["units"]["pet"]["health"]["attachTextTo"] = "Health";
	E.db["unitframe"]["units"]["pet"]["health"]["xOffset"] = 2;
	E.db["unitframe"]["units"]["pet"]["health"]["text_format"] = "[healthcolor][health:current]";
	E.db["unitframe"]["units"]["pet"]["health"]["position"] = "LEFT";
	E.db["unitframe"]["units"]["player"]["debuffs"]["enable"] = false;
	E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] = true;
	E.db["unitframe"]["units"]["player"]["portrait"]["width"] = 150;
	E.db["unitframe"]["units"]["player"]["classbar"]["detachFromFrame"] = true;
	E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false;
	E.db["unitframe"]["units"]["player"]["aurabar"]["height"] = 33;
	E.db["unitframe"]["units"]["player"]["swingbar"]["enable"] = false;
	E.db["unitframe"]["units"]["player"]["combatfade"] = true;
	E.db["unitframe"]["units"]["player"]["height"] = 41;
	E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Friz Quadrata TT";
	E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false;
	E.db["unitframe"]["units"]["targettarget"]["width"] = 135;
	E.db["unitframe"]["units"]["targettarget"]["height"] = 35;
	E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 216;
	E.db["unitframe"]["units"]["raid40"]["debuffs"]["sizeOverride"] = 0;
	E.db["unitframe"]["units"]["raid40"]["GPSArrow"]["enable"] = false;
	E.db["unitframe"]["units"]["raid40"]["buffIndicator"]["enable"] = false;
	E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = true;
	E.db["unitframe"]["units"]["target"]["health"]["text_format"] = "[healthcolor][health:current-max]";
	E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = -42;
	E.db["unitframe"]["units"]["target"]["height"] = 41;
	E.db["unitframe"]["units"]["target"]["buffs"]["numrows"] = 4;
	E.db["unitframe"]["units"]["target"]["aurabar"]["maxBars"] = 5;
	E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false;
	E.db["unitframe"]["units"]["arena"]["castbar"]["width"] = 246;
	E.db["datatexts"]["fontSize"] = 14;
	E.db["datatexts"]["font"] = "Friz Quadrata TT";
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["right"] = "System";
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["left"] = "Bags";
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["middle"] = "Gold";
	E.db["datatexts"]["rightChatPanel"] = false;
	E.db["actionbar"]["bar3"]["mouseover"] = true;
	E.db["actionbar"]["bar3"]["buttons"] = 12;
	E.db["actionbar"]["bar3"]["alpha"] = 0.65;
	E.db["actionbar"]["bar3"]["buttonsize"] = 42;
	E.db["actionbar"]["bar3"]["backdrop"] = true;
	E.db["actionbar"]["bar6"]["buttons"] = 3;
	E.db["actionbar"]["bar6"]["buttonspacing"] = 1;
	E.db["actionbar"]["bar6"]["buttonsize"] = 60;
	E.db["actionbar"]["bar6"]["alpha"] = 0.22;
	E.db["actionbar"]["bar10"]["enabled"] = true;
	E.db["actionbar"]["bar10"]["backdropSpacing"] = 0;
	E.db["actionbar"]["bar10"]["mouseover"] = true;
	E.db["actionbar"]["bar10"]["buttonsPerRow"] = 1;
	E.db["actionbar"]["bar10"]["backdrop"] = false;
	E.db["actionbar"]["bar10"]["buttonspacing"] = 0;
	E.db["actionbar"]["desaturateOnCooldown"] = true;
	E.db["actionbar"]["bar9"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["bar9"]["buttonsize"] = 42;
	E.db["actionbar"]["bar9"]["backdrop"] = false;
	E.db["actionbar"]["bar2"]["enabled"] = true;
	E.db["actionbar"]["bar2"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["bar2"]["buttons"] = 6;
	E.db["actionbar"]["bar2"]["buttonsize"] = 60;
	E.db["actionbar"]["bar2"]["showGrid"] = false;
	E.db["actionbar"]["bar1"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["bar1"]["buttons"] = 6;
	E.db["actionbar"]["bar1"]["showGrid"] = false;
	E.db["actionbar"]["bar1"]["buttonsize"] = 60;
	E.db["actionbar"]["bar1"]["paging"]["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 1;";
	E.db["actionbar"]["bar5"]["enabled"] = false;
	E.db["actionbar"]["bar5"]["buttons"] = 12;
	E.db["actionbar"]["bar5"]["showGrid"] = false;
	E.db["actionbar"]["bar5"]["buttonsPerRow"] = 12;
	E.db["actionbar"]["bar5"]["buttonsize"] = 60;
	E.db["actionbar"]["globalFadeAlpha"] = 0.75;
	E.db["actionbar"]["bar7"]["enabled"] = true;
	E.db["actionbar"]["bar7"]["buttons"] = 2;
	E.db["actionbar"]["bar7"]["showGrid"] = false;
	E.db["actionbar"]["bar7"]["backdrop"] = false;
	E.db["actionbar"]["bar7"]["visibility"] = "[vehicleui] hide; show[combat]show; hide[mod]show; hide";
	E.db["actionbar"]["bar7"]["buttonsize"] = 50;
	E.db["actionbar"]["barShapeShift"]["buttonsize"] = 48;
	E.db["actionbar"]["barShapeShift"]["mouseover"] = true;
	E.db["actionbar"]["barShapeShift"]["point"] = "BOTTOMLEFT";
	E.db["actionbar"]["font"] = "Friz Quadrata TT";
	E.db["actionbar"]["barPet"]["inheritGlobalFade"] = true;
	E.db["actionbar"]["barPet"]["backdrop"] = false;
	E.db["actionbar"]["barPet"]["buttonsize"] = 40;
	E.db["actionbar"]["bar4"]["mouseover"] = true;
	E.db["actionbar"]["bar4"]["backdrop"] = false;
	E.db["actionbar"]["bar4"]["showGrid"] = false;
	E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["enable"] = true;
	E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["size"] = 39;
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["baseHeight"] = 32;
	E.db["nameplates"]["font"] = "Friz Quadrata TT";
	E.db["bags"]["countFontSize"] = 14;
	E.db["bags"]["countFont"] = "Friz Quadrata TT";
	E.db["bags"]["itemLevelFont"] = "Friz Quadrata TT";
	E.db["bags"]["clearSearchOnClose"] = true;
	E.db["bags"]["itemLevelFontSize"] = 14;
	E.db["bags"]["bagSize"] = 40;
	E.db["bags"]["bankSize"] = 40;
	E.db["auras"]["buffs"]["countFontSize"] = 14;
	E.db["auras"]["buffs"]["durationFontSize"] = 14;
	E.db["auras"]["debuffs"]["countFontSize"] = 14;
	E.db["auras"]["debuffs"]["durationFontSize"] = 14;
	E.db["auras"]["font"] = "Friz Quadrata TT";
	

	-- Private
	E.private["general"]["selectQuestReward"] = true;
	E.private["general"]["loot"] = false;
	E.private["enhanced"]["character"]["enable"] = true;
	E.private["theme"] = "class";
	E.private["install_complete"] = "5.41";
	E.private["tooltip"]["enable"] = false;
	E.private["actionbar"]["lbf"]["enable"] = true;
	E.private["nameplates"]["enable"] = false;


	-- Global
	E.global["general"]["smallerWorldMap"] = false;
	E.global["general"]["fadeMapWhenMoving"] = false;
	E.global["general"]["autoScale"] = false;
	E.global["general"]["animateConfig"] = false;
	E.global["general"]["minUiScale"] = 0.5;
	E.global["general"]["commandBarSetting"] = "DISABLED";
	E.global["uiScale"] = "0.64";
	E.global["userInformedNewChanges1"] = true;
	E.global["sle"]["advanced"]["confirmed"] = true;
	E.global["sle"]["advanced"]["optionsLimits"] = true;
	E.global["sle"]["advanced"]["cyrillics"]["commands"] = true;
	
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