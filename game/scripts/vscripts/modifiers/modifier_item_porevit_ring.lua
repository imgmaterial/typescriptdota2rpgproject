--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 5,["12"] = 4,["13"] = 5,["14"] = 12,["15"] = 13,["16"] = 12,["17"] = 16,["18"] = 17,["19"] = 16,["20"] = 20,["21"] = 21,["22"] = 22,["23"] = 24,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["29"] = 20,["30"] = 32,["31"] = 34,["32"] = 32,["33"] = 38,["34"] = 40,["35"] = 42,["36"] = 44,["37"] = 44,["38"] = 44,["39"] = 46,["40"] = 46,["41"] = 46,["42"] = 46,["43"] = 46,["44"] = 46,["45"] = 47,["49"] = 38,["50"] = 54,["51"] = 56,["52"] = 54,["53"] = 59,["54"] = 61,["55"] = 59,["56"] = 64,["57"] = 66,["58"] = 64,["59"] = 5,["61"] = 4,["63"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_porevit_ring_buff = require("modifiers.modifier_item_porevit_ring_buff")
local modifier_item_porevit_ring_buff = ____modifier_item_porevit_ring_buff.modifier_item_porevit_ring_buff
____exports.modifier_item_porevit_ring = __TS__Class()
local modifier_item_porevit_ring = ____exports.modifier_item_porevit_ring
modifier_item_porevit_ring.name = "modifier_item_porevit_ring"
__TS__ClassExtends(modifier_item_porevit_ring, BaseModifier)
function modifier_item_porevit_ring.prototype.IsHidden(self)
    return true
end
function modifier_item_porevit_ring.prototype.IsPurgable(self)
    return false
end
function modifier_item_porevit_ring.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.proc_chance = ability:GetSpecialValueFor("proc_chance")
        self.bonus_hp_regen = ability:GetSpecialValueFor("bonus_hp_regen")
        self.bonus_health = ability:GetSpecialValueFor("bonus_health")
        self.bonus_strength = ability:GetSpecialValueFor("bonus_strength")
        self.duration = ability:GetSpecialValueFor("buff_duration")
    end
end
function modifier_item_porevit_ring.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT, MODIFIER_PROPERTY_HEALTH_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function modifier_item_porevit_ring.prototype.OnTakeDamage(self)
    if IsServer() then
        if self.proc_chance then
            if math.floor(
                math.random() * 100
            ) < self.proc_chance then
                self:GetParent():AddNewModifier(
                    self:GetParent(),
                    self:GetAbility(),
                    modifier_item_porevit_ring_buff.name,
                    {duration = self.duration}
                )
                return 0
            end
        end
    end
end
function modifier_item_porevit_ring.prototype.GetModifierBonusStats_Strength(self)
    return self.bonus_strength or 0
end
function modifier_item_porevit_ring.prototype.GetModifierHealthBonus(self)
    return self.bonus_health or 0
end
function modifier_item_porevit_ring.prototype.GetModifierConstantHealthRegen(self)
    return self.bonus_hp_regen or 0
end
modifier_item_porevit_ring = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_porevit_ring
)
return ____exports
