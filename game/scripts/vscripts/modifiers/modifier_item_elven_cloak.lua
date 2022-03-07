--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 3,["13"] = 4,["14"] = 12,["15"] = 13,["16"] = 12,["17"] = 16,["18"] = 17,["19"] = 16,["20"] = 20,["21"] = 21,["22"] = 22,["23"] = 24,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["29"] = 20,["30"] = 32,["31"] = 34,["32"] = 32,["33"] = 37,["34"] = 38,["35"] = 37,["36"] = 41,["37"] = 42,["38"] = 41,["39"] = 45,["40"] = 46,["41"] = 45,["42"] = 49,["43"] = 51,["44"] = 53,["45"] = 55,["46"] = 55,["47"] = 55,["48"] = 57,["49"] = 57,["50"] = 57,["51"] = 57,["52"] = 57,["53"] = 57,["54"] = 58,["57"] = 61,["59"] = 63,["60"] = 49,["61"] = 4,["63"] = 3,["65"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_elven_cloak_buff = require("modifiers.modifier_item_elven_cloak_buff")
local modifier_item_elven_cloak_buff = ____modifier_item_elven_cloak_buff.modifier_item_elven_cloak_buff
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
        self.proc_chance = ability:GetSpecialValueFor("proc_chance")
        self.duration = ability:GetSpecialValueFor("buff_duration")
    end
end
function modifier_item_elven_cloak.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_PROCATTACK_FEEDBACK}
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
function modifier_item_elven_cloak.prototype.GetModifierProcAttack_Feedback(self)
    if IsServer() then
        if self.proc_chance then
            if math.floor(
                math.random() * 100
            ) < self.proc_chance then
                self:GetParent():AddNewModifier(
                    self:GetParent(),
                    self:GetAbility(),
                    modifier_item_elven_cloak_buff.name,
                    {duration = self.duration}
                )
                return 0
            end
        end
        return 0
    end
    return 0
end
modifier_item_elven_cloak = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_elven_cloak
)
return ____exports
