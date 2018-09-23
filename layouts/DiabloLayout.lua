--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)
local mod = E:GetModule("Areasis Layouts");
local l = E:NewModule("Diablo Layouts", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

local function RegisterElvUI()
    mod:RegisterLayout("Diablo", "ElvUI", function(_)
        ViragDevTool_AddData("", "Installing ElvUI for Diablo Layouts")
        -- Profile
        E.db["databars"]["experience"]["textFont"] = "ABF";
        E.db["databars"]["experience"]["textFormat"] = "PERCENT";
        E.db["databars"]["experience"]["textOutline"] = "NONE";
        E.db["databars"]["experience"]["orientation"] = "HORIZONTAL";
        E.db["databars"]["experience"]["height"] = 28;
        E.db["databars"]["experience"]["textSize"] = 21;
        E.db["databars"]["experience"]["width"] = 580;
        E.db["databars"]["reputation"]["textFormat"] = "PERCENT";
        E.db["databars"]["reputation"]["orientation"] = "HORIZONTAL";
        E.db["databars"]["reputation"]["textSize"] = 21;
        E.db["databars"]["reputation"]["enable"] = true;
        E.db["databars"]["reputation"]["height"] = 28;
        E.db["databars"]["reputation"]["mouseover"] = true;
        E.db["databars"]["reputation"]["width"] = 580;
        E.db["currentTutorial"] = 3;
        E.db["general"]["totems"]["size"] = 28;
        E.db["general"]["stickyFrames"] = 1;
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
        E.db["enhanced"]["unitframe"]["portraitHDModelFix"]["modelsToFix"] = "scourgemale.m2; scourgefemale.m2; humanfemale.m2; dwarfmale.m2; orcmalenpc.m2; scourgemalenpc.m2; scourgefemalenpc.m2; dwarfmalenpc.m2; humanmalekid.m2; humanfemalekid.m2; chicken.m2; rat.m2; nightelffemale.m2";
        E.db["enhanced"]["unitframe"]["portraitHDModelFix"]["debug"] = true;
        E.db["enhanced"]["chat"]["dpsLinks"] = true;
        E.db["enhanced"]["equipment"]["enable"] = true;
        E.db["enhanced"]["equipment"]["itemlevel"]["enable"] = true;
        E.db["enhanced"]["character"]["player"]["orderName"] = "1,2,6,7,3,4,5";
        E.db["enhanced"]["character"]["player"]["collapsedName"]["MELEE_COMBAT"] = true;
        E.db["enhanced"]["character"]["player"]["collapsedName"]["RANGED_COMBAT"] = true;
        E.db["enhanced"]["character"]["player"]["collapsedName"]["RESISTANCE"] = true;
        E.db["enhanced"]["character"]["companionBackground"] = true;
        E.db["enhanced"]["loseControl"]["enable"] = true;
        E.db["enhanced"]["watchframe"]["city"] = "NONE";
        E.db["enhanced"]["watchframe"]["enable"] = true;
        E.db["enhanced"]["interruptTracker"]["enable"] = true;
        E.db["enhanced"]["actionbars"]["transparentActionbars"]["transparentButtons"] = true;
        E.db["enhanced"]["actionbars"]["transparentActionbars"]["transparentBackdrops"] = true;
        E.db["Areasis Layouts"]["install_version"] = "1.00";
        E.db["addOnSkins"]["recountBackdropAlpha"] = 0.5;
        E.db["addOnSkins"]["embed"]["leftWindow"] = "Recount";
        E.db["addOnSkins"]["embed"]["embedType"] = "SINGLE";
        E.db["hideTutorial"] = 1;
        E.db["auras"]["buffs"]["countFontSize"] = 14;
        E.db["auras"]["buffs"]["durationFontSize"] = 14;
        E.db["auras"]["debuffs"]["countFontSize"] = 14;
        E.db["auras"]["debuffs"]["durationFontSize"] = 14;
        E.db["auras"]["font"] = "Friz Quadrata TT";
        E.db["locplus"]["lpfontsize"] = 14;
        E.db["locplus"]["dig"] = false;
        E.db["locplus"]["hidecoords"] = true;
        E.db["layoutSet"] = "dpsCaster";
        E.db["VAT"]["threshold"]["buffsvalue"] = 10;
        E.db["VAT"]["threshold"]["buffs"] = true;
        E.db["chat"]["fontSize"] = 14;
        E.db["chat"]["keywordSound"] = "NPCScan";
        E.db["chat"]["tabFont"] = "Friz Quadrata TT";
        E.db["chat"]["keywords"] = "invation";
        E.db["chat"]["font"] = "Friz Quadrata TT";
        E.db["chat"]["panelHeight"] = 146;
        E.db["chat"]["panelWidthRight"] = 350;
        E.db["chat"]["tapFontSize"] = 14;
        E.db["chat"]["panelWidth"] = 450;
        E.db["chat"]["panelBackdrop"] = "SHOWBOTH";
        E.db["CBO"]["player"]["overlay"] = false;
        E.db["CBO"]["focus"]["overlay"] = false;
        E.db["CBO"]["target"]["overlay"] = false;
        E.db["CBO"]["arena"]["overlay"] = false;
        E.db["CBO"]["pet"]["overlay"] = false;
        E.db["CBO"]["boss"]["overlay"] = false;
        E.db["movers"]["ElvUI_InterruptTrackerHeaderMover"] = "TOP,ElvUIParent,TOP,0,-490";
        E.db["movers"]["ElvUF_PlayerCastbarMover"] = "TOP,ElvUIParent,TOP,0,-200";
        E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,472";
        E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,0";
        E.db["movers"]["GMMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-38,-268";
        E.db["movers"]["MinimapButtonGrabberMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-56,440";
        E.db["movers"]["LocationMover"] = "TOP,ElvUIParent,TOP,0,-28";
        E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,6,737";
        E.db["movers"]["ElvUF_PlayerSwingBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,494,309";
        E.db["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-391,204";
        E.db["movers"]["ClassBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,223,513";
        E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-24";
        E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,270,-93";
        E.db["movers"]["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-60,5";
        E.db["movers"]["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,169,280";
        E.db["movers"]["ElvBar_Pet"] = "BOTTOM,ElvUIParent,BOTTOM,0,96";
        E.db["movers"]["AscensionEnergyRageMover"] = "BOTTOM,ElvUIParent,BOTTOM,163,418";
        E.db["movers"]["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,320,814";
        E.db["movers"]["ElvUF_TargetAuraMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,257";
        E.db["movers"]["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-334,-181";
        E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-186,35";
        E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,186,35";
        E.db["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,6,487";
        E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,207";
        E.db["movers"]["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-234";
        E.db["movers"]["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,258";
        E.db["movers"]["TotemBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-450,0";
        E.db["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,146";
        E.db["movers"]["ReputationBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,4";
        E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,193,769";
        E.db["movers"]["ElvAB_5"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,260";
        E.db["movers"]["ElvUF_PlayerAuraMover"] = "BOTTOM,ElvUIParent,BOTTOM,-143,270";
        E.db["movers"]["WatchFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,88,-35";
        E.db["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-52,-413";
        E.db["movers"]["ShiftAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,936,145";
        E.db["movers"]["LoseControlMover"] = "TOP,ElvUIParent,TOP,0,-573";
        E.db["movers"]["ElvAB_9"] = "BOTTOM,ElvUIParent,BOTTOM,-94,414";
        E.db["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,196,442";
        E.db["movers"]["ElvAB_10"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,146";
        E.db["movers"]["PvPMover"] = "TOP,ElvUIParent,TOP,0,-33";
        E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-169,279";
        E.db["movers"]["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,644,168";
        E.db["movers"]["ElvAB_7"] = "BOTTOM,ElvUIParent,BOTTOM,290,515";
        E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,0";
        E.db["movers"]["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-28";
        E.db["movers"]["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,258";
        E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,193,739";
        E.db["tooltip"]["textFontSize"] = 14;
        E.db["tooltip"]["font"] = "Friz Quadrata TT";
        E.db["tooltip"]["healthBar"]["font"] = "Friz Quadrata TT";
        E.db["tooltip"]["fontSize"] = 14;
        E.db["tooltip"]["smallTextFontSize"] = 14;
        E.db["tooltip"]["headerFontSize"] = 14;
        E.db["unitframe"]["fontSize"] = 17;
        E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.04;
        E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.49;
        E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 1;
        E.db["unitframe"]["colors"]["colorhealthbyvalue"] = false;
        E.db["unitframe"]["colors"]["healthclass"] = true;
        E.db["unitframe"]["colors"]["castClassColor"] = true;
        E.db["unitframe"]["colors"]["health"]["r"] = 0.15294117647059;
        E.db["unitframe"]["colors"]["health"]["g"] = 0.15294117647059;
        E.db["unitframe"]["colors"]["health"]["b"] = 0.15294117647059;
        E.db["unitframe"]["colors"]["forcehealthreaction"] = true;
        E.db["unitframe"]["font"] = "Expressway";
        E.db["unitframe"]["smoothbars"] = true;
        E.db["unitframe"]["statusbar"] = "Smooth";
        E.db["unitframe"]["units"]["pet"]["power"]["xOffset"] = -2;
        E.db["unitframe"]["units"]["pet"]["power"]["attachTextTo"] = "Health";
        E.db["unitframe"]["units"]["pet"]["power"]["text_format"] = "[powercolor][power:current]";
        E.db["unitframe"]["units"]["pet"]["power"]["position"] = "RIGHT";
        E.db["unitframe"]["units"]["pet"]["enable"] = false;
        E.db["unitframe"]["units"]["pet"]["health"]["attachTextTo"] = "Health";
        E.db["unitframe"]["units"]["pet"]["health"]["xOffset"] = 2;
        E.db["unitframe"]["units"]["pet"]["health"]["text_format"] = "[healthcolor][health:current]";
        E.db["unitframe"]["units"]["pet"]["health"]["position"] = "LEFT";
        E.db["unitframe"]["units"]["pet"]["name"]["attachTextTo"] = "Health";
        E.db["unitframe"]["units"]["pet"]["name"]["yOffset"] = 16;
        E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 216;
        E.db["unitframe"]["units"]["arena"]["castbar"]["width"] = 246;
        E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false;
        E.db["unitframe"]["units"]["targettarget"]["width"] = 135;
        E.db["unitframe"]["units"]["targettarget"]["height"] = 35;
        E.db["unitframe"]["units"]["player"]["debuffs"]["anchorPoint"] = "TOPRIGHT";
        E.db["unitframe"]["units"]["player"]["debuffs"]["attachTo"] = "BUFFS";
        E.db["unitframe"]["units"]["player"]["debuffs"]["maxDuration"] = 300;
        E.db["unitframe"]["units"]["player"]["debuffs"]["enable"] = false;
        E.db["unitframe"]["units"]["player"]["portrait"]["rotation"] = 24;
        E.db["unitframe"]["units"]["player"]["portrait"]["higherPortrait"] = true;
        E.db["unitframe"]["units"]["player"]["portrait"]["xOffset"] = 0;
        E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] = true;
        E.db["unitframe"]["units"]["player"]["portrait"]["portraitAlpha"] = 1;
        E.db["unitframe"]["units"]["player"]["portrait"]["width"] = 150;
        E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false;
        E.db["unitframe"]["units"]["player"]["classbar"]["detachFromFrame"] = true;
        E.db["unitframe"]["units"]["player"]["name"]["text_format"] = "[namecolor][name:medium] [difficultycolor][smartlevel] [shortclassification]";
        E.db["unitframe"]["units"]["player"]["name"]["position"] = "RIGHT";
        E.db["unitframe"]["units"]["player"]["combatfade"] = true;
        E.db["unitframe"]["units"]["player"]["height"] = 68;
        E.db["unitframe"]["units"]["player"]["power"]["xOffset"] = 2;
        E.db["unitframe"]["units"]["player"]["power"]["text_format"] = "";
        E.db["unitframe"]["units"]["player"]["health"]["xOffset"] = 5;
        E.db["unitframe"]["units"]["player"]["orientation"] = "RIGHT";
        E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME";
        E.db["unitframe"]["units"]["player"]["buffs"]["anchorPoint"] = "TOPRIGHT";
        E.db["unitframe"]["units"]["raid40"]["debuffs"]["sizeOverride"] = 0;
        E.db["unitframe"]["units"]["raid40"]["GPSArrow"]["enable"] = false;
        E.db["unitframe"]["units"]["raid40"]["buffIndicator"]["enable"] = false;
        E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = true;
        E.db["unitframe"]["units"]["target"]["portrait"]["higherPortrait"] = true;
        E.db["unitframe"]["units"]["target"]["portrait"]["portraitAlpha"] = 1;
        E.db["unitframe"]["units"]["target"]["portrait"]["xOffset"] = 0;
        E.db["unitframe"]["units"]["target"]["portrait"]["rotation"] = 92;
        E.db["unitframe"]["units"]["target"]["portrait"]["yOffset"] = 0;
        E.db["unitframe"]["units"]["target"]["portrait"]["width"] = 150;
        E.db["unitframe"]["units"]["target"]["power"]["text_format"] = "";
        E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = 10;
        E.db["unitframe"]["units"]["target"]["name"]["position"] = "LEFT";
        E.db["unitframe"]["units"]["target"]["GPSArrow"]["enable"] = true;
        E.db["unitframe"]["units"]["target"]["height"] = 68;
        E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false;
        E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Friz Quadrata TT";
        E.db["datatexts"]["font"] = "Friz Quadrata TT";
        E.db["datatexts"]["panels"]["RightChatDataPanel"]["right"] = "";
        E.db["datatexts"]["panels"]["RightChatDataPanel"]["left"] = "";
        E.db["datatexts"]["panels"]["RightChatDataPanel"]["middle"] = "Broker_FindGroup";
        E.db["datatexts"]["panels"]["LeftChatDataPanel"]["right"] = "System";
        E.db["datatexts"]["panels"]["LeftChatDataPanel"]["left"] = "Bags";
        E.db["datatexts"]["panels"]["LeftChatDataPanel"]["middle"] = "Gold";
        E.db["datatexts"]["fontSize"] = 14;
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
        E.db["actionbar"]["bar10"]["backdrop"] = false;
        E.db["actionbar"]["bar10"]["buttonsPerRow"] = 6;
        E.db["actionbar"]["bar10"]["mouseover"] = true;
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
        E.db["actionbar"]["bar1"]["paging"]["DRUID"] = "[bonusbar:1,nostealth] 1; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 1;";
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
        E.db["actionbar"]["bar7"]["buttonsize"] = 50;
        E.db["actionbar"]["bar7"]["visibility"] = "[vehicleui] hide; show[combat]show; hide[mod]show; hide";
        E.db["actionbar"]["barPet"]["inheritGlobalFade"] = true;
        E.db["actionbar"]["barPet"]["buttonsize"] = 30;
        E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10;
        E.db["actionbar"]["font"] = "Friz Quadrata TT";
        E.db["actionbar"]["barShapeShift"]["buttonsize"] = 48;
        E.db["actionbar"]["barShapeShift"]["mouseover"] = true;
        E.db["actionbar"]["barShapeShift"]["point"] = "BOTTOMLEFT";
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
        E.db["abm"]["target"] = true;
        E.db["abm"]["player"] = true;
        E.db["abm"]["focusw"] = 169;


        -- Private
        E.private["general"]["selectQuestReward"] = true;
        E.private["general"]["loot"] = false;
        E.private["enhanced"]["character"]["enable"] = true;
        E.private["theme"] = "class";
        E.private["install_complete"] = "5.41";
        E.private["tooltip"]["enable"] = false;
        E.private["unitframe"]["enable"] = false;
        E.private["actionbar"]["lbf"]["enable"] = true;
        E.private["nameplates"]["enable"] = false;


        -- Global
        E.global["sle"]["advanced"]["cyrillics"]["commands"] = true;
        E.global["sle"]["advanced"]["optionsLimits"] = true;
        E.global["sle"]["advanced"]["confirmed"] = true;
        E.global["uiScale"] = "0.71111111111111";
        E.global["userInformedNewChanges1"] = true;
        E.global["general"]["smallerWorldMap"] = false;
        E.global["general"]["minUiScale"] = 0.5;
        E.global["general"]["animateConfig"] = false;
        E.global["general"]["fadeMapWhenMoving"] = false;
        E.global["general"]["commandBarSetting"] = "DISABLED";
    end)
end


local function RegisterQuartz()
    mod:RegisterLayout("Diablo", "Quartz3", function(Quartz3)
        ViragDevTool_AddData(Quartz3, "Installing Quartz3 for Diablo Layouts")
        Quartz3.db.profile["channelingcolor"] = {0.32,0.3,1};
        Quartz3.db.profile["completecolor"] = {0.12,0.86,0.15};
        Quartz3.db.profile["borderalpha"] = 1;
        Quartz3.db.profile["bordercolor"] = {0,0,0};
        Quartz3.db.profile["backgroundcolor"] = {0,0,0};
        Quartz3.db.profile["failcolor"] = {1,0.09,0};
        Quartz3.db.profile["hidesamwise"] = true;
        Quartz3.db.profile["spelltextcolor"] = {1,1,1};
        Quartz3.db.profile["castingcolor"] = {1,0.49,0};
        Quartz3.db.profile["sparkcolor"] = {1,1,1,0.5};
        Quartz3.db.profile["backgroundalpha"] = 1;
        Quartz3.db.profile["casttimeprecision"] = 1;
        Quartz3.db.profile["modules"]["Swing"] = false;
        Quartz3.db.profile["modules"]["GCD"] = false;
        Quartz3.db.profile["modules"]["Focus"] = false;
        Quartz3.db.profile["modules"]["Buff"] = false;
        Quartz3.db.profile["modules"]["Mirror"] = false;
        Quartz3.db.profile["modules"]["Pet"] = false;
        Quartz3.db.profile["modules"]["Latency"] = false;
        Quartz3.db.profile["timetextcolor"] = {1,1,1};
        
        -- Player
        Quartz3.db.children.Player.profile["noInterruptShield"] = true;
        Quartz3.db.children.Player.profile["h"] = 30;
        Quartz3.db.children.Player.profile["timefontsize"] = 12;
        Quartz3.db.children.Player.profile["noInterruptColorChange"] = false;
        Quartz3.db.children.Player.profile["noInterruptBorderColor"] = {0.71,0.73,0.71};
        Quartz3.db.children.Player.profile["targetname"] = false;
        Quartz3.db.children.Player.profile["w"] = 462;
        Quartz3.db.children.Player.profile["y"] = 355;
        Quartz3.db.children.Player.profile["x"] = 729.00001313035;
        Quartz3.db.children.Player.profile["iconalpha"] = 0.9;
        Quartz3.db.children.Player.profile["icongap"] = 4;
        Quartz3.db.children.Player.profile["iconposition"] = "left";
        Quartz3.db.children.Player.profile["hideblizz"] = true;
        Quartz3.db.children.Player.profile["noInterruptBorderChange"] = false;
        Quartz3.db.children.Player.profile["scale"] = 1;
        Quartz3.db.children.Player.profile["border"] = "Blizzard Tooltip";
        Quartz3.db.children.Player.profile["hidenametext"] = false;
        Quartz3.db.children.Player.profile["noInterruptColor"] = {1,0.49,0};
        Quartz3.db.children.Player.profile["fontsize"] = 14;
        Quartz3.db.children.Player.profile["spellrankstyle"] = "roman";
        Quartz3.db.children.Player.profile["texture"] = "Blizzard";
        Quartz3.db.children.Player.profile["timetexty"] = 0;
        Quartz3.db.children.Player.profile["noInterruptBorder"] = "Tooltip enlarged";
        Quartz3.db.children.Player.profile["font"] = "Expressway";
        Quartz3.db.children.Player.profile["nametextx"] = 3;
        Quartz3.db.children.Player.profile["timetextx"] = 3;
        Quartz3.db.children.Player.profile["alpha"] = 1;
        Quartz3.db.children.Player.profile["hidetimetext"] = false;
        Quartz3.db.children.Player.profile["showticks"] = true;
        Quartz3.db.children.Player.profile["timetextposition"] = "right";
        Quartz3.db.children.Player.profile["spellrank"] = false;
        Quartz3.db.children.Player.profile["nametexty"] = 0;
        Quartz3.db.children.Player.profile["nametextposition"] = "left";
        Quartz3.db.children.Player.profile["noInterruptBorderAlpha"] = 1;
        Quartz3.db.children.Player.profile["hideicon"] = true;
        Quartz3.db.children.Player.profile["hidecasttime"] = false;
    
        -- Target
        Quartz3.db.children.Target.profile["timetextx"] = 3;
        Quartz3.db.children.Target.profile["showhostile"] = true;
        Quartz3.db.children.Target.profile["h"] = 18;
        Quartz3.db.children.Target.profile["timefontsize"] = 12;
        Quartz3.db.children.Target.profile["noInterruptColorChange"] = false;
        Quartz3.db.children.Target.profile["noInterruptBorderColor"] = {0.71,0.73,0.71};
        Quartz3.db.children.Target.profile["showfriendly"] = true;
        Quartz3.db.children.Target.profile["targetname"] = false;
        Quartz3.db.children.Target.profile["w"] = 318;
        Quartz3.db.children.Target.profile["y"] = 185.99984585516;
        Quartz3.db.children.Target.profile["font"] = "Friz Quadrata TT";
        Quartz3.db.children.Target.profile["iconalpha"] = 0.9;
        Quartz3.db.children.Target.profile["icongap"] = 4;
        Quartz3.db.children.Target.profile["iconposition"] = "right";
        Quartz3.db.children.Target.profile["noInterruptBorderChange"] = false;
        Quartz3.db.children.Target.profile["scale"] = 1;
        Quartz3.db.children.Target.profile["border"] = "Blizzard Tooltip";
        Quartz3.db.children.Target.profile["hidenametext"] = false;
        Quartz3.db.children.Target.profile["noInterruptColor"] = {1,0.49,0};
        Quartz3.db.children.Target.profile["fontsize"] = 14;
        Quartz3.db.children.Target.profile["spellrankstyle"] = "roman";
        Quartz3.db.children.Target.profile["hidetimetext"] = false;
        Quartz3.db.children.Target.profile["timetexty"] = 0;
        Quartz3.db.children.Target.profile["texture"] = "LiteStep";
        Quartz3.db.children.Target.profile["x"] = 796.22281191779;
        Quartz3.db.children.Target.profile["nametextx"] = 3;
        Quartz3.db.children.Target.profile["alpha"] = 1;
        Quartz3.db.children.Target.profile["noInterruptBorder"] = "Tooltip enlarged";
        Quartz3.db.children.Target.profile["noInterruptShield"] = true;
        Quartz3.db.children.Target.profile["timetextposition"] = "right";
        Quartz3.db.children.Target.profile["spellrank"] = false;
        Quartz3.db.children.Target.profile["nametexty"] = 0;
        Quartz3.db.children.Target.profile["nametextposition"] = "left";
        Quartz3.db.children.Target.profile["noInterruptBorderAlpha"] = 1;
        Quartz3.db.children.Target.profile["hideicon"] = true;
        Quartz3.db.children.Target.profile["hidecasttime"] = false;

        Quartz3:ApplySettings()
    end)
end


function l:OnInitialize()
    RegisterElvUI()
    RegisterQuartz()
end