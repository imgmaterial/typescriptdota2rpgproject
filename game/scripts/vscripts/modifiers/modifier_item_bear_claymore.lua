--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 11,["13"] = 12,["14"] = 11,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 23,["22"] = 24,["23"] = 25,["25"] = 19,["26"] = 29,["27"] = 30,["28"] = 29,["29"] = 36,["30"] = 37,["31"] = 36,["32"] = 40,["33"] = 41,["34"] = 40,["35"] = 44,["36"] = 46,["37"] = 44,["38"] = 49,["39"] = 50,["41"] = 51,["43"] = 52,["45"] = 49,["46"] = 4,["48"] = 3,["50"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bear__claymore = __TS__Class()
local modifier_item_bear__claymore = ____exports.modifier_item_bear__claymore
modifier_item_bear__claymore.name = "modifier_item_bear__claymore"
__TS__ClassExtends(modifier_item_bear__claymore, BaseModifier)
function modifier_item_bear__claymore.prototype.IsHidden(self)
    return true
end
function modifier_item_bear__claymore.prototype.IsPurgable(self)
    return false
end
function modifier_item_bear__claymore.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_strength = ability:GetSpecialValueFor("bonus_strength")
        self.bonus_damage = ability:GetSpecialValueFor("bonus_damage")
        self.bonus_attack_speed = ability:GetSpecialValueFor("bonus_attack_speed")
    end
end
function modifier_item_bear__claymore.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_EVENT_ON_ABILITY_EXECUTED}
end
function modifier_item_bear__claymore.prototype.GetModifierPreAttack_BonusDamage(self)
    return self.bonus_damage or 0
end
function modifier_item_bear__claymore.prototype.GetModifierExtraStrengthBonus(self)
    return self.bonus_strength or 0
end
function modifier_item_bear__claymore.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return (self.bonus_attack_speed or 0) * -1
end
function modifier_item_bear__claymore.prototype.OnAbilityExecuted(self, params)
    if not IsServer() then
    end
    if not params.ability then
    end
    if params.ability:IsItem() or params.ability:IsToggle() then
    end
end
modifier_item_bear__claymore = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_bear__claymore
)
return ____exports
