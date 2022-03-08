--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 5,["11"] = 6,["12"] = 5,["13"] = 6,["14"] = 16,["15"] = 17,["16"] = 16,["17"] = 20,["18"] = 21,["19"] = 20,["20"] = 24,["21"] = 25,["22"] = 26,["23"] = 28,["24"] = 29,["25"] = 30,["26"] = 31,["27"] = 32,["28"] = 33,["29"] = 34,["31"] = 24,["32"] = 40,["33"] = 41,["34"] = 40,["35"] = 45,["36"] = 47,["37"] = 49,["38"] = 50,["39"] = 51,["40"] = 52,["41"] = 54,["42"] = 56,["43"] = 56,["44"] = 56,["45"] = 56,["46"] = 56,["47"] = 56,["48"] = 57,["49"] = 57,["50"] = 57,["51"] = 57,["52"] = 57,["53"] = 57,["57"] = 45,["58"] = 63,["59"] = 65,["60"] = 63,["61"] = 68,["62"] = 69,["63"] = 68,["64"] = 72,["65"] = 73,["66"] = 72,["67"] = 76,["68"] = 77,["69"] = 76,["70"] = 6,["72"] = 5,["74"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_dress_of_makosh_buff = require("modifiers.modifier_item_dress_of_makosh_buff")
local modifier_item_dress_of_makosh_buff = ____modifier_item_dress_of_makosh_buff.modifier_item_dress_of_makosh_buff
____exports.modifier_item_dress_of_makosh = __TS__Class()
local modifier_item_dress_of_makosh = ____exports.modifier_item_dress_of_makosh
modifier_item_dress_of_makosh.name = "modifier_item_dress_of_makosh"
__TS__ClassExtends(modifier_item_dress_of_makosh, BaseModifier)
function modifier_item_dress_of_makosh.prototype.IsHidden(self)
    return true
end
function modifier_item_dress_of_makosh.prototype.IsPurgable(self)
    return false
end
function modifier_item_dress_of_makosh.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_armor = ability:GetSpecialValueFor("bonus_armor")
        self.bonus_strength = ability:GetSpecialValueFor("bonus_strength")
        self.bonus_agility = ability:GetSpecialValueFor("bonus_agility")
        self.bonus_evasion = ability:GetSpecialValueFor("bonus_evasion")
        self.duration = ability:GetSpecialValueFor("buff_duration")
        self.cooldown = ability:GetSpecialValueFor("buff_cooldown")
        self.proc_hp = ability:GetSpecialValueFor("proc_hp") / 100
    end
end
function modifier_item_dress_of_makosh.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_EVASION_CONSTANT, MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function modifier_item_dress_of_makosh.prototype.OnTakeDamage(self, params)
    if IsServer() then
        local parent = self:GetParent()
        local ability = self:GetAbility()
        local proc_hp_point = self.proc_hp or 0
        if __TS__OptionalMethodCall(ability, "IsCooldownReady", false) then
            if parent:GetHealth() < (parent:GetMaxHealth() * proc_hp_point) then
                parent:AddNewModifier(
                    parent,
                    self:GetAbility(),
                    modifier_item_dress_of_makosh_buff.name,
                    {duration = self.duration}
                )
                __TS__OptionalMethodCall(
                    self:GetAbility(),
                    "StartCooldown",
                    false,
                    self.cooldown or 0
                )
            end
        end
    end
end
function modifier_item_dress_of_makosh.prototype.GetModifierEvasion_Constant(self)
    return self.bonus_evasion or 0
end
function modifier_item_dress_of_makosh.prototype.GetModifierBonusStats_Strength(self)
    return self.bonus_strength or 0
end
function modifier_item_dress_of_makosh.prototype.GetModifierBonusStats_Agility(self)
    return self.bonus_agility or 0
end
function modifier_item_dress_of_makosh.prototype.GetModifierPhysicalArmorBonus(self)
    return self.bonus_armor or 0
end
modifier_item_dress_of_makosh = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_dress_of_makosh
)
return ____exports
