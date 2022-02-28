--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 10,["13"] = 11,["14"] = 10,["15"] = 14,["16"] = 15,["17"] = 14,["18"] = 18,["19"] = 19,["20"] = 20,["21"] = 22,["22"] = 23,["24"] = 18,["25"] = 28,["26"] = 30,["27"] = 28,["28"] = 35,["29"] = 36,["30"] = 35,["31"] = 39,["32"] = 40,["33"] = 39,["34"] = 4,["36"] = 3,["38"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bear_claymore_buff = __TS__Class()
local modifier_item_bear_claymore_buff = ____exports.modifier_item_bear_claymore_buff
modifier_item_bear_claymore_buff.name = "modifier_item_bear_claymore_buff"
__TS__ClassExtends(modifier_item_bear_claymore_buff, BaseModifier)
function modifier_item_bear_claymore_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_bear_claymore_buff.prototype.IsPurgable(self)
    return true
end
function modifier_item_bear_claymore_buff.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_strength_buff = ability:GetSpecialValueFor("bonus_strength_buff")
        self.bonus_hp_regen_buff = ability:GetSpecialValueFor("bonus_hp_regen_buff")
    end
end
function modifier_item_bear_claymore_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
function modifier_item_bear_claymore_buff.prototype.GetModifierConstantHealthRegen(self)
    return self.bonus_hp_regen_buff or 0
end
function modifier_item_bear_claymore_buff.prototype.GetModifierExtraStrengthBonus(self)
    return self.bonus_strength_buff or 0
end
modifier_item_bear_claymore_buff = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_bear_claymore_buff
)
return ____exports
