import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_decay_tome_debuff extends BaseModifier
{
    debuff_magic_reduction ? :number;
    IsHidden(): boolean {
        return false
    }

    IsPurgable(): boolean {
        return true 
    }

    OnCreated(params: object): void {
        const ability = this.GetAbility()
        if (ability)
        {
            this.debuff_magic_reduction = ability.GetSpecialValueFor("debuff_magic_reduction")
        } 
    }

    DeclareFunctions()
    {
        return [ModifierFunction.MAGICAL_RESISTANCE_BONUS]
    }


    GetModifierMagicalResistanceBonus()
    {
        return this.debuff_magic_reduction ?? 0;
    }


}