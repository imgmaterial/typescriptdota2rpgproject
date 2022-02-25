--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 13,["13"] = 14,["14"] = 13,["15"] = 17,["16"] = 18,["17"] = 17,["18"] = 21,["19"] = 22,["20"] = 23,["21"] = 25,["22"] = 26,["23"] = 27,["24"] = 28,["25"] = 29,["27"] = 21,["28"] = 33,["29"] = 34,["30"] = 33,["31"] = 42,["32"] = 44,["33"] = 42,["34"] = 47,["35"] = 49,["36"] = 47,["37"] = 52,["38"] = 54,["39"] = 52,["40"] = 57,["41"] = 59,["42"] = 61,["43"] = 61,["44"] = 61,["45"] = 63,["46"] = 65,["47"] = 66,["48"] = 67,["51"] = 70,["53"] = 72,["54"] = 57,["55"] = 75,["56"] = 77,["57"] = 79,["58"] = 81,["59"] = 82,["60"] = 83,["61"] = 84,["62"] = 85,["65"] = 88,["66"] = 75,["67"] = 4,["69"] = 3,["71"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_swift_blade = __TS__Class()
local modifier_item_swift_blade = ____exports.modifier_item_swift_blade
modifier_item_swift_blade.name = "modifier_item_swift_blade"
__TS__ClassExtends(modifier_item_swift_blade, BaseModifier)
function modifier_item_swift_blade.prototype.IsHidden(self)
    return true
end
function modifier_item_swift_blade.prototype.IsPurgable(self)
    return false
end
function modifier_item_swift_blade.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability then
        self.bonus_agility = ability:GetSpecialValueFor("bonus_agility")
        self.bonus_damage = ability:GetSpecialValueFor("bonus_damage")
        self.bonus_attack_speed = ability:GetSpecialValueFor("bonus_attack_speed")
        self.bonus_agility_damage = ability:GetSpecialValueFor("bonus_agility_damage")
        self.proc_chance = ability:GetSpecialValueFor("proc_chance")
    end
end
function modifier_item_swift_blade.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_PROCATTACK_FEEDBACK, MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL, MODIFIER_PROPERTY_PROCATTACK_FEEDBACK}
end
function modifier_item_swift_blade.prototype.GetModifierBonusStats_Agility(self)
    return self.bonus_agility or 0
end
function modifier_item_swift_blade.prototype.GetModifierPreAttack_BonusDamage(self)
    return self.bonus_damage or 0
end
function modifier_item_swift_blade.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonus_attack_speed or 0
end
function modifier_item_swift_blade.prototype.GetModifierProcAttack_BonusDamage_Physical(self, params)
    if self.proc_chance then
        if math.floor(
            math.random() * 100
        ) < self.proc_chance then
            if self:GetParent():IsHero() then
                self.record = params.record
                local agi_proc = self:GetParent():GetAgility()
                return (self.bonus_agility_damage or 0) * agi_proc
            end
        end
        return 0
    end
    return 0
end
function modifier_item_swift_blade.prototype.GetModifierProcAttack_Feedback(self, params)
    if IsServer() then
        if self.record and (self.record == params.record) then
            self.record = nil
            local sound = "Hero_Juggernaut.BladeDance"
            local particle_cast = "particles/generic_gameplay/generic_manaburn.vpcf"
            EmitSoundOn(sound, params.target)
            local effect_cast = ParticleManager:CreateParticle(particle_cast, 0, params.target)
        end
    end
    return 0
end
modifier_item_swift_blade = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_swift_blade
)
return ____exports
