--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 8,["13"] = 9,["14"] = 8,["15"] = 12,["16"] = 13,["17"] = 12,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 20,["22"] = 21,["24"] = 16,["25"] = 26,["26"] = 28,["27"] = 26,["28"] = 31,["29"] = 33,["30"] = 31,["31"] = 36,["32"] = 38,["33"] = 36,["34"] = 4,["36"] = 3,["38"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_dress_of_makosh_buff = __TS__Class()
local modifier_item_dress_of_makosh_buff = ____exports.modifier_item_dress_of_makosh_buff
modifier_item_dress_of_makosh_buff.name = "modifier_item_dress_of_makosh_buff"
__TS__ClassExtends(modifier_item_dress_of_makosh_buff, BaseModifier)
function modifier_item_dress_of_makosh_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_dress_of_makosh_buff.prototype.IsPurgable(self)
    return true
end
function modifier_item_dress_of_makosh_buff.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_evasion_buff = ability:GetSpecialValueFor("bonus_evasion_buff")
        self.hp_regen_buff = ability:GetSpecialValueFor("hp_regen_buff")
    end
end
function modifier_item_dress_of_makosh_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_EVASION_CONSTANT, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
function modifier_item_dress_of_makosh_buff.prototype.GetModifierConstantHealthRegen(self)
    return self.hp_regen_buff or 0
end
function modifier_item_dress_of_makosh_buff.prototype.GetModifierEvasion_Constant(self)
    return self.bonus_evasion_buff or 0
end
modifier_item_dress_of_makosh_buff = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_dress_of_makosh_buff
)
return ____exports
