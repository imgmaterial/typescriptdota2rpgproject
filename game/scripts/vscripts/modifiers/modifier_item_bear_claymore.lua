--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 5,["12"] = 4,["13"] = 5,["14"] = 12,["15"] = 13,["16"] = 12,["17"] = 16,["18"] = 17,["19"] = 16,["20"] = 20,["21"] = 21,["22"] = 22,["23"] = 24,["24"] = 25,["25"] = 26,["26"] = 27,["28"] = 20,["29"] = 31,["30"] = 32,["31"] = 31,["32"] = 38,["33"] = 39,["34"] = 38,["35"] = 42,["36"] = 43,["37"] = 42,["38"] = 46,["39"] = 48,["40"] = 46,["41"] = 51,["42"] = 52,["44"] = 53,["46"] = 54,["48"] = 56,["49"] = 56,["50"] = 56,["51"] = 56,["52"] = 56,["53"] = 56,["54"] = 51,["55"] = 5,["57"] = 4,["59"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_bear_claymore_buff = require("modifiers.modifier_item_bear_claymore_buff")
local modifier_item_bear_claymore_buff = ____modifier_item_bear_claymore_buff.modifier_item_bear_claymore_buff
____exports.modifier_item_bear_claymore = __TS__Class()
local modifier_item_bear_claymore = ____exports.modifier_item_bear_claymore
modifier_item_bear_claymore.name = "modifier_item_bear_claymore"
__TS__ClassExtends(modifier_item_bear_claymore, BaseModifier)
function modifier_item_bear_claymore.prototype.IsHidden(self)
    return true
end
function modifier_item_bear_claymore.prototype.IsPurgable(self)
    return false
end
function modifier_item_bear_claymore.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_strength = ability:GetSpecialValueFor("bonus_strength")
        self.bonus_damage = ability:GetSpecialValueFor("bonus_damage")
        self.bonus_attack_speed = ability:GetSpecialValueFor("bonus_attack_speed")
        self.buff_duration = ability:GetSpecialValueFor("bonus_duration")
    end
end
function modifier_item_bear_claymore.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_EVENT_ON_ABILITY_EXECUTED}
end
function modifier_item_bear_claymore.prototype.GetModifierPreAttack_BonusDamage(self)
    return self.bonus_damage or 0
end
function modifier_item_bear_claymore.prototype.GetModifierExtraStrengthBonus(self)
    return self.bonus_strength or 0
end
function modifier_item_bear_claymore.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonus_attack_speed or 0
end
function modifier_item_bear_claymore.prototype.OnAbilityExecuted(self, params)
    if not IsServer() then
    end
    if not params.ability then
    end
    if params.ability:IsItem() or params.ability:IsToggle() then
    end
    self:GetParent():AddNewModifier(
        self:GetParent(),
        self:GetAbility(),
        modifier_item_bear_claymore_buff.name,
        {duration = self.buff_duration}
    )
end
modifier_item_bear_claymore = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_bear_claymore
)
return ____exports
