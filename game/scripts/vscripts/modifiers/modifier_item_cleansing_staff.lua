--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 11,["13"] = 12,["14"] = 11,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 23,["22"] = 24,["23"] = 25,["25"] = 19,["26"] = 29,["27"] = 30,["28"] = 29,["29"] = 35,["30"] = 36,["31"] = 35,["32"] = 39,["33"] = 40,["34"] = 39,["35"] = 43,["36"] = 44,["37"] = 43,["38"] = 4,["40"] = 3,["42"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_cleansing_staff = __TS__Class()
local modifier_item_cleansing_staff = ____exports.modifier_item_cleansing_staff
modifier_item_cleansing_staff.name = "modifier_item_cleansing_staff"
__TS__ClassExtends(modifier_item_cleansing_staff, BaseModifier)
function modifier_item_cleansing_staff.prototype.IsHidden(self)
    return true
end
function modifier_item_cleansing_staff.prototype.IsPurgable(self)
    return false
end
function modifier_item_cleansing_staff.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_intelligence = ability:GetSpecialValueFor("bonus_intelligence")
        self.bonus_damage = ability:GetSpecialValueFor("bonus_damage")
        self.spell_amp = ability:GetSpecialValueFor("spell_amp")
    end
end
function modifier_item_cleansing_staff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_INTELLECT_BONUS, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE}
end
function modifier_item_cleansing_staff.prototype.GetModifierBonusStats_Intellect(self)
    return self.bonus_intelligence or 0
end
function modifier_item_cleansing_staff.prototype.GetModifierSpellAmplify_Percentage(self)
    return self.spell_amp or 0
end
function modifier_item_cleansing_staff.prototype.GetModifierPreAttack_BonusDamage(self)
    return self.bonus_damage or 0
end
modifier_item_cleansing_staff = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_cleansing_staff
)
return ____exports
