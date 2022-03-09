--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 9,["13"] = 10,["14"] = 9,["15"] = 13,["16"] = 14,["17"] = 13,["18"] = 17,["19"] = 18,["20"] = 19,["21"] = 21,["22"] = 22,["23"] = 23,["25"] = 17,["26"] = 27,["27"] = 29,["28"] = 27,["29"] = 32,["30"] = 34,["31"] = 32,["32"] = 37,["33"] = 39,["34"] = 37,["35"] = 4,["37"] = 3,["39"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_porevit_ring_buff = __TS__Class()
local modifier_item_porevit_ring_buff = ____exports.modifier_item_porevit_ring_buff
modifier_item_porevit_ring_buff.name = "modifier_item_porevit_ring_buff"
__TS__ClassExtends(modifier_item_porevit_ring_buff, BaseModifier)
function modifier_item_porevit_ring_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_porevit_ring_buff.prototype.IsPurgable(self)
    return true
end
function modifier_item_porevit_ring_buff.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_armor_buff = ability:GetSpecialValueFor("bonus_armor_buff")
        self.bonus_magic_res_buff = ability:GetSpecialValueFor("bonus_magic_res_buff")
        self.heal_buff = ability:GetSpecialValueFor("heal_buff")
    end
end
function modifier_item_porevit_ring_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end
function modifier_item_porevit_ring_buff.prototype.GetModifierPhysicalArmorBonus(self)
    return self.bonus_armor_buff or 0
end
function modifier_item_porevit_ring_buff.prototype.GetModifierMagicalResistanceBonus(self)
    return self.bonus_magic_res_buff or 0
end
modifier_item_porevit_ring_buff = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_porevit_ring_buff
)
return ____exports
