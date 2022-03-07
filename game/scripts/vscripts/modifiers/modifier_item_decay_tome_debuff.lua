--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 7,["13"] = 8,["14"] = 7,["15"] = 11,["16"] = 12,["17"] = 11,["18"] = 15,["19"] = 16,["20"] = 17,["21"] = 19,["23"] = 15,["24"] = 23,["25"] = 25,["26"] = 23,["27"] = 29,["28"] = 31,["29"] = 29,["30"] = 4,["32"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_decay_tome_debuff = __TS__Class()
local modifier_item_decay_tome_debuff = ____exports.modifier_item_decay_tome_debuff
modifier_item_decay_tome_debuff.name = "modifier_item_decay_tome_debuff"
__TS__ClassExtends(modifier_item_decay_tome_debuff, BaseModifier)
function modifier_item_decay_tome_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_decay_tome_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_item_decay_tome_debuff.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.debuff_magic_reduction = ability:GetSpecialValueFor("debuff_magic_reduction")
    end
end
function modifier_item_decay_tome_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end
function modifier_item_decay_tome_debuff.prototype.GetModifierMagicalResistanceBonus(self)
    return self.debuff_magic_reduction or 0
end
modifier_item_decay_tome_debuff = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_decay_tome_debuff
)
return ____exports
