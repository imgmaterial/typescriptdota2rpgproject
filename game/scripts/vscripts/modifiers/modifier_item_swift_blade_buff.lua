--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 8,["13"] = 9,["14"] = 8,["15"] = 12,["16"] = 13,["17"] = 12,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 20,["23"] = 16,["24"] = 24,["25"] = 25,["26"] = 24,["27"] = 28,["28"] = 30,["29"] = 28,["30"] = 4,["32"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_swift_blade_buff = __TS__Class()
local modifier_item_swift_blade_buff = ____exports.modifier_item_swift_blade_buff
modifier_item_swift_blade_buff.name = "modifier_item_swift_blade_buff"
__TS__ClassExtends(modifier_item_swift_blade_buff, BaseModifier)
function modifier_item_swift_blade_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_swift_blade_buff.prototype.IsPurgable(self)
    return true
end
function modifier_item_swift_blade_buff.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_buff_attack_speed = ability:GetSpecialValueFor("bonus_buff_attack_speed")
    end
end
function modifier_item_swift_blade_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end
function modifier_item_swift_blade_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonus_buff_attack_speed or 0
end
modifier_item_swift_blade_buff = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_swift_blade_buff
)
return ____exports
