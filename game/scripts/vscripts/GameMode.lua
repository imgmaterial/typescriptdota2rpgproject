--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 12,["11"] = 13,["12"] = 12,["14"] = 25,["15"] = 28,["16"] = 28,["17"] = 28,["18"] = 28,["19"] = 28,["20"] = 29,["21"] = 29,["22"] = 29,["23"] = 29,["24"] = 29,["25"] = 32,["26"] = 32,["27"] = 32,["28"] = 33,["29"] = 33,["30"] = 33,["31"] = 36,["32"] = 37,["33"] = 45,["34"] = 46,["35"] = 32,["36"] = 32,["37"] = 24,["38"] = 14,["39"] = 15,["40"] = 16,["41"] = 14,["42"] = 19,["43"] = 21,["44"] = 19,["45"] = 50,["46"] = 51,["47"] = 52,["48"] = 54,["49"] = 55,["50"] = 50,["51"] = 58,["52"] = 59,["53"] = 62,["55"] = 63,["56"] = 63,["57"] = 64,["58"] = 63,["62"] = 68,["63"] = 70,["64"] = 71,["65"] = 71,["66"] = 71,["67"] = 72,["68"] = 71,["69"] = 71,["72"] = 78,["73"] = 79,["74"] = 79,["75"] = 79,["76"] = 79,["78"] = 58,["79"] = 83,["80"] = 84,["81"] = 83,["82"] = 90,["83"] = 91,["84"] = 90,["85"] = 96,["86"] = 98,["87"] = 100,["88"] = 101,["89"] = 103,["92"] = 96,["93"] = 12});
local ____exports = {}
local ____tstl_2Dutils = require("lib.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____modifier_panic = require("modifiers.modifier_panic")
local modifier_panic = ____modifier_panic.modifier_panic
local heroSelectionTime = 20
____exports.GameMode = __TS__Class()
local GameMode = ____exports.GameMode
GameMode.name = "GameMode"
function GameMode.prototype.____constructor(self)
    self:configure()
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:OnStateChange() end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(event) return self:OnNpcSpawned(event) end,
        nil
    )
    CustomGameEventManager:RegisterListener(
        "ui_panel_closed",
        function(_, data)
            print(
                ("Player " .. tostring(data.PlayerID)) .. " has closed their UI panel."
            )
            local player = PlayerResource:GetPlayer(data.PlayerID)
            CustomGameEventManager:Send_ServerToPlayer(player, "example_event", {myNumber = 42, myBoolean = true, myString = "Hello!", myArrayOfNumbers = {1.414, 2.718, 3.142}})
            local hero = player:GetAssignedHero()
            hero:AddNewModifier(hero, nil, modifier_panic.name, {duration = 5})
        end
    )
end
function GameMode.Precache(context)
    PrecacheResource("particle", "particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_meepo.vsndevts", context)
end
function GameMode.Activate()
    GameRules.Addon = __TS__New(____exports.GameMode)
end
function GameMode.prototype.configure(self)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 3)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 3)
    GameRules:SetShowcaseTime(0)
    GameRules:SetHeroSelectionTime(heroSelectionTime)
end
function GameMode.prototype.OnStateChange(self)
    local state = GameRules:State_Get()
    if IsInToolsMode() and (state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP) then
        do
            local i = 0
            while i < 4 do
                Tutorial:AddBot("npc_dota_hero_lina", "", "", false)
                i = i + 1
            end
        end
    end
    if state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
        if IsInToolsMode() then
            Timers:CreateTimer(
                3,
                function()
                    GameRules:FinishCustomGameSetup()
                end
            )
        end
    end
    if state == DOTA_GAMERULES_STATE_PRE_GAME then
        Timers:CreateTimer(
            0.2,
            function() return self:StartGame() end
        )
    end
end
function GameMode.prototype.StartGame(self)
    print("Game starting!")
end
function GameMode.prototype.Reload(self)
    print("Script reloaded!")
end
function GameMode.prototype.OnNpcSpawned(self, event)
    local unit = EntIndexToHScript(event.entindex)
    if unit:IsRealHero() then
        if not unit:HasAbility("meepo_earthbind_ts_example") then
            unit:AddAbility("meepo_earthbind_ts_example")
        end
    end
end
GameMode = __TS__Decorate({reloadable}, GameMode)
return ____exports
