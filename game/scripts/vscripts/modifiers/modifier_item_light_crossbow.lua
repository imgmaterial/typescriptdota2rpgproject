--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 12,["13"] = 13,["14"] = 12,["15"] = 16,["16"] = 17,["17"] = 16,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 24,["22"] = 25,["23"] = 26,["24"] = 27,["25"] = 28,["27"] = 20,["28"] = 32,["29"] = 33,["30"] = 32,["31"] = 40,["32"] = 42,["33"] = 40,["34"] = 45,["35"] = 47,["36"] = 45,["37"] = 50,["38"] = 52,["39"] = 50,["40"] = 55,["41"] = 57,["42"] = 55,["43"] = 60,["44"] = 62,["45"] = 63,["46"] = 64,["47"] = 67,["48"] = 68,["50"] = 72,["52"] = 60,["53"] = 4,["55"] = 3,["57"] = 4});
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
        self.bonus_attack_range = ability:GetSpecialValueFor("bonus_attack_range")
    end
end
function modifier_item_light_crossbow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_PROCATTACK_FEEDBACK, MODIFIER_PROPERTY_ATTACK_RANGE_BONUS}
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
function modifier_item_light_crossbow.prototype.GetModifierAttackRangeBonus(self)
    return self.bonus_attack_range or 0
end
function modifier_item_light_crossbow.prototype.GetModifierProcAttack_Feedback(self)
    local attack_target = self:GetParent():GetAttackTarget()
    local owner_unit = self:GetParent()
    if attack_target then
        local damage_per_unit_distance = self.bonus_distance_damage or 0
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
