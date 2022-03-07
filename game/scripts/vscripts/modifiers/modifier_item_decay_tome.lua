--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 11,["13"] = 12,["14"] = 11,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 23,["22"] = 24,["23"] = 25,["24"] = 26,["26"] = 19,["27"] = 30,["28"] = 31,["29"] = 30,["30"] = 34,["31"] = 36,["32"] = 34,["33"] = 39,["34"] = 41,["35"] = 39,["36"] = 44,["37"] = 46,["38"] = 44,["39"] = 49,["40"] = 51,["41"] = 49,["42"] = 4,["44"] = 3,["46"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_decay_tome = __TS__Class()
local modifier_item_decay_tome = ____exports.modifier_item_decay_tome
modifier_item_decay_tome.name = "modifier_item_decay_tome"
__TS__ClassExtends(modifier_item_decay_tome, BaseModifier)
function modifier_item_decay_tome.prototype.IsHidden(self)
    return true
end
function modifier_item_decay_tome.prototype.IsPurgable(self)
    return false
end
function modifier_item_decay_tome.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_intelligence = ability:GetSpecialValueFor("bonus_intelligence")
        self.bonus_mana_regen = ability:GetSpecialValueFor("bonus_mana_regen")
        self.bonus_mana = ability:GetSpecialValueFor("bonus_mana")
        self.bonus_hp_regen = ability:GetSpecialValueFor("bonus_hp_regen")
    end
end
function modifier_item_decay_tome.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_INTELLECT_BONUS, MODIFIER_PROPERTY_MANA_BONUS, MODIFIER_PROPERTY_MANA_REGEN_CONSTANT, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
function modifier_item_decay_tome.prototype.GetModifierBonusStats_Intellect(self)
    return self.bonus_intelligence or 0
end
function modifier_item_decay_tome.prototype.GetModifierManaBonus(self)
    return self.bonus_mana or 0
end
function modifier_item_decay_tome.prototype.GetModifierConstantManaRegen(self)
    return self.bonus_mana_regen or 0
end
function modifier_item_decay_tome.prototype.GetModifierConstantHealthRegen(self)
    return self.bonus_hp_regen or 0
end
modifier_item_decay_tome = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_decay_tome
)
return ____exports
