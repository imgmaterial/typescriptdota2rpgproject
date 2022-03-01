--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 12,["13"] = 13,["14"] = 12,["15"] = 16,["16"] = 17,["17"] = 16,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 24,["22"] = 25,["23"] = 26,["24"] = 27,["25"] = 28,["27"] = 20,["28"] = 33,["29"] = 35,["30"] = 33,["31"] = 38,["32"] = 40,["33"] = 38,["34"] = 43,["35"] = 45,["36"] = 43,["37"] = 48,["38"] = 50,["39"] = 48,["40"] = 4,["42"] = 3,["44"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_stone_plates = __TS__Class()
local modifier_item_stone_plates = ____exports.modifier_item_stone_plates
modifier_item_stone_plates.name = "modifier_item_stone_plates"
__TS__ClassExtends(modifier_item_stone_plates, BaseModifier)
function modifier_item_stone_plates.prototype.IsHidden(self)
    return true
end
function modifier_item_stone_plates.prototype.IsPurgable(self)
    return false
end
function modifier_item_stone_plates.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_armor = ability:GetSpecialValueFor("bonus_armor")
        self.bonus_strength = ability:GetSpecialValueFor("bonus_strength")
        self.damage_reduction = ability:GetSpecialValueFor("damage_reduction")
        self.buff_duration = ability:GetSpecialValueFor("buff_duration")
        self.bonus_magic_resist_buff = ability:GetSpecialValueFor("bonus_magic_resist_buff")
    end
end
function modifier_item_stone_plates.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE}
end
function modifier_item_stone_plates.prototype.GetModifierPhysicalArmorBonus(self)
    return self.bonus_armor or 0
end
function modifier_item_stone_plates.prototype.GetModifierBonusStats_Strength(self)
    return self.bonus_strength or 0
end
function modifier_item_stone_plates.prototype.GetModifierIncomingDamage_Percentage(self)
    return self.damage_reduction or 0
end
modifier_item_stone_plates = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_stone_plates
)
return ____exports
