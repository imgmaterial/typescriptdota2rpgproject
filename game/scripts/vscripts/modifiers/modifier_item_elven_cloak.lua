--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 11,["13"] = 12,["14"] = 11,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 23,["22"] = 24,["23"] = 25,["25"] = 19,["26"] = 29,["27"] = 31,["28"] = 29,["29"] = 34,["30"] = 35,["31"] = 34,["32"] = 38,["33"] = 39,["34"] = 38,["35"] = 42,["36"] = 43,["37"] = 42,["38"] = 4,["40"] = 3,["42"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_elven_cloak = __TS__Class()
local modifier_item_elven_cloak = ____exports.modifier_item_elven_cloak
modifier_item_elven_cloak.name = "modifier_item_elven_cloak"
__TS__ClassExtends(modifier_item_elven_cloak, BaseModifier)
function modifier_item_elven_cloak.prototype.IsHidden(self)
    return true
end
function modifier_item_elven_cloak.prototype.IsPurgable(self)
    return false
end
function modifier_item_elven_cloak.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_agility = ability:GetSpecialValueFor("bonus_agility")
        self.bonus_strength = ability:GetSpecialValueFor("bonus_strength")
        self.bonus_armor = ability:GetSpecialValueFor("bonus_armor")
    end
end
function modifier_item_elven_cloak.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_STATS_AGILITY_BONUS}
end
function modifier_item_elven_cloak.prototype.GetModifierBonusStats_Strength(self)
    return self.bonus_strength or 0
end
function modifier_item_elven_cloak.prototype.GetModifierBonusStats_Agility(self)
    return self.bonus_agility or 0
end
function modifier_item_elven_cloak.prototype.GetModifierPhysicalArmorBonus(self)
    return self.bonus_armor or 0
end
modifier_item_elven_cloak = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_elven_cloak
)
return ____exports
