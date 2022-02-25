import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_light_crossbow extends BaseModifier
{
    bonus_agility ?:number;
    bonus_damage ?:number;
    bonus_attack_speed ?:number;
    bonus_distance_damage ?:number;
    bonus_attack_range ?:number;

    IsHidden(): boolean {
        return true
    }

    IsPurgable(): boolean {
        return false
    }

    OnCreated(params: object): void {
        const ability = this.GetAbility()
        if (ability)
        {
            this.bonus_agility = ability.GetSpecialValueFor("bonus_agility");
            this.bonus_damage = ability.GetSpecialValueFor("bonus_damage");
            this.bonus_attack_speed = ability.GetSpecialValueFor("bonus_attack_speed")
            this.bonus_distance_damage = ability.GetSpecialValueFor("bonus_distance_damage")
            this.bonus_attack_range = ability.GetSpecialValueFor("bonus_attack_range")
        }
    }

    DeclareFunctions() {
        return [ModifierFunction.STATS_AGILITY_BONUS, 
            ModifierFunction.PREATTACK_BONUS_DAMAGE, 
            ModifierFunction.ATTACKSPEED_BONUS_CONSTANT, 
            ModifierFunction.PROCATTACK_FEEDBACK,
            ModifierFunction.ATTACK_RANGE_BONUS];
    }

    GetModifierBonusStats_Agility()
    {
        return this.bonus_agility ?? 0;
    }

    GetModifierPreAttack_BonusDamage()
    {
        return this.bonus_damage ?? 0;
    }

    GetModifierAttackSpeedBonus_Constant()
    {
        return this.bonus_attack_speed ?? 0;
    }

    GetModifierAttackRangeBonus()
    {
        return this.bonus_attack_range ?? 0;
    }

    GetModifierProcAttack_Feedback()
    {
        const attack_target = this.GetParent().GetAttackTarget()
        const owner_unit = this.GetParent()
        if (attack_target)
        { 
            
            const damage_per_unit_distance:number = this.bonus_distance_damage ?? 0;
            return (owner_unit.GetRangeToUnit(attack_target)*damage_per_unit_distance)/100
        }
        else
        {
            return 0
        }
    }
}