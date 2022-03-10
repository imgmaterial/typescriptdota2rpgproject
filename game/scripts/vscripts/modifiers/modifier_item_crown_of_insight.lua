--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 12,["13"] = 13,["14"] = 12,["15"] = 16,["16"] = 17,["17"] = 16,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 24,["22"] = 25,["23"] = 26,["24"] = 27,["25"] = 28,["27"] = 20,["28"] = 32,["29"] = 34,["30"] = 32,["31"] = 38,["32"] = 40,["33"] = 38,["34"] = 43,["35"] = 45,["36"] = 43,["37"] = 48,["38"] = 50,["39"] = 48,["40"] = 53,["41"] = 55,["42"] = 57,["43"] = 59,["44"] = 59,["45"] = 59,["46"] = 61,["50"] = 53,["51"] = 4,["53"] = 3,["55"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modidifier_item_crown_of_insight = __TS__Class()
local modidifier_item_crown_of_insight = ____exports.modidifier_item_crown_of_insight
modidifier_item_crown_of_insight.name = "modidifier_item_crown_of_insight"
__TS__ClassExtends(modidifier_item_crown_of_insight, BaseModifier)
function modidifier_item_crown_of_insight.prototype.IsHidden(self)
    return true
end
function modidifier_item_crown_of_insight.prototype.IsPurgable(self)
    return true
end
function modidifier_item_crown_of_insight.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_int = ability:GetSpecialValueFor("bonus_int")
        self.bonus_armor = ability:GetSpecialValueFor("bonus_armor")
        self.bonus_mana_regen = ability:GetSpecialValueFor("bonus_mana_regen")
        self.proc_chance = ability:GetSpecialValueFor("proc_chance")
        self.mana_proc = ability:GetSpecialValueFor("mana_proc")
    end
end
function modidifier_item_crown_of_insight.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_INTELLECT_BONUS, MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_MANA_REGEN_CONSTANT}
end
function modidifier_item_crown_of_insight.prototype.GetModifierBonusStats_Intellect(self)
    return self.bonus_int or 0
end
function modidifier_item_crown_of_insight.prototype.GetModifierPhysicalArmorBonus(self)
    return self.bonus_armor or 0
end
function modidifier_item_crown_of_insight.prototype.GetModifierConstantManaRegen(self)
    return self.bonus_mana_regen or 0
end
function modidifier_item_crown_of_insight.prototype.OnSpentMana(self)
    if IsServer() then
        if self.proc_chance then
            if math.floor(
                math.random() * 100
            ) < self.proc_chance then
                print("proc")
                self:GetParent():GiveMana(self.mana_proc or 0)
            end
        end
    end
end
modidifier_item_crown_of_insight = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modidifier_item_crown_of_insight
)
return ____exports
