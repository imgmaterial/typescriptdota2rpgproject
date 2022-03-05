import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_stone_plates_buff extends BaseModifier
{
    bonus_magic_resist_buff ?:number;

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
            this.bonus_magic_resist_buff = ability.GetSpecialValueFor("bonus_magic_resist_buff") 
        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.MAGICAL_RESISTANCE_BONUS]
    }

    GetModifierMagicalResistanceBonus()
    {
        return this.bonus_magic_resist_buff ?? 0;
    }
}