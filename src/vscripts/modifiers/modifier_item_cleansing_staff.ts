import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_cleansing_staff extends BaseModifier
{   
    bonus_intelligence ? :number;
    bonus_damage ? :number;
    spell_amp ? :number;


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
            this.bonus_intelligence = ability.GetSpecialValueFor("bonus_intelligence")
            this.bonus_damage = ability.GetSpecialValueFor("bonus_damage")
            this.spell_amp = ability.GetSpecialValueFor("spell_amp")
        }
    }

    DeclareFunctions() {
        return [ModifierFunction.STATS_INTELLECT_BONUS, 
            ModifierFunction.PREATTACK_BONUS_DAMAGE, 
            ModifierFunction.SPELL_AMPLIFY_PERCENTAGE];
    }

    GetModifierBonusStats_Intellect(){
        return this.bonus_intelligence ?? 0;
    }

    GetModifierSpellAmplify_Percentage(){
        return this.spell_amp ?? 0;
    }

    GetModifierPreAttack_BonusDamage(){
        return this.bonus_damage ?? 0;
    }
}