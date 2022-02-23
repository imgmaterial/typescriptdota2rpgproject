--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 11,["13"] = 12,["14"] = 11,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 23,["22"] = 24,["23"] = 25,["24"] = 26,["26"] = 19,["27"] = 30,["28"] = 31,["29"] = 30,["30"] = 34,["31"] = 36,["32"] = 34,["33"] = 39,["34"] = 41,["35"] = 39,["36"] = 44,["37"] = 46,["38"] = 44,["39"] = 49,["40"] = 51,["41"] = 52,["42"] = 53,["43"] = 56,["44"] = 57,["45"] = 58,["47"] = 62,["49"] = 49,["50"] = 4,["52"] = 3,["54"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_light_crossbow = __TS__Class()
local modifier_item_light_crossbow = ____exports.modifier_item_light_crossbow
modifier_item_light_crossbow.name = "modifier_item_light_crossbow"
__TS__ClassExtends(modifier_item_light_crossbow, BaseModifier)
function modifier_item_light_crossbow.prototype.IsHidden(self)
    return true
end
function modifier_item_light_crossbow.prototype.IsPurgable(self)
    return false
end
function modifier_item_light_crossbow.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_agility = ability:GetSpecialValueFor("bonus_agility")
        self.bonus_damage = ability:GetSpecialValueFor("bonus_damage")
        self.bonus_attack_speed = ability:GetSpecialValueFor("bonus_attack_speed")
        self.bonus_distance_damage = ability:GetSpecialValueFor("bonus_distance_damage")
    end
end
function modifier_item_light_crossbow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE}
end
function modifier_item_light_crossbow.prototype.GetModifierBonusStats_Agility(self)
    return self.bonus_agility or 0
end
function modifier_item_light_crossbow.prototype.GetModifierPreAttack_BonusDamage(self)
    return self.bonus_damage or 0
end
function modifier_item_light_crossbow.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonus_attack_speed or 0
end
function modifier_item_light_crossbow.prototype.GetModifierProcAttack_BonusDamage_Pure(self)
    local attack_target = self:GetParent():GetAttackTarget()
    local owner_unit = self:GetParent()
    if attack_target then
        local damage_per_unit_distance = self.bonus_distance_damage or 0
        SendToConsole("target")
        return (owner_unit:GetRangeToUnit(attack_target) * damage_per_unit_distance) / 100
    else
        return 0
    end
end
modifier_item_light_crossbow = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_light_crossbow
)
return ____exports
