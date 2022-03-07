import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_decay_tome extends BaseModifier
{
    bonus_intelligence ? :number;
    bonus_mana_regen ? :number;
    bonus_mana ? :number;
    bonus_hp_regen ?:number;
    
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
            this.bonus_mana_regen = ability.GetSpecialValueFor("bonus_mana_regen")
            this.bonus_mana = ability.GetSpecialValueFor("bonus_mana")
            this.bonus_hp_regen = ability.GetSpecialValueFor("bonus_hp_regen")
        }
    }

    DeclareFunctions(){
        return [ModifierFunction.STATS_INTELLECT_BONUS, ModifierFunction.MANA_BONUS,ModifierFunction.MANA_REGEN_CONSTANT,ModifierFunction.HEALTH_REGEN_CONSTANT ]
    }

    GetModifierBonusStats_Intellect()
    {
        return this.bonus_intelligence ?? 0;
    }

    GetModifierManaBonus()
    {
        return this.bonus_mana ?? 0;
    }

    GetModifierConstantManaRegen()
    {
        return this.bonus_mana_regen ?? 0;
    }

    GetModifierConstantHealthRegen()
    {
        return this.bonus_hp_regen ?? 0;
    }




}