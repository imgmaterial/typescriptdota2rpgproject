import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_elven_cloak extends BaseModifier
{
    bonus_agility ? :number;
    bonus_strength ?:number;
    bonus_armor ?: number;


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
            this.bonus_agility = ability.GetSpecialValueFor("bonus_agility")
            this.bonus_strength = ability.GetSpecialValueFor("bonus_strength")
            this.bonus_armor = ability.GetSpecialValueFor("bonus_armor")
        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.PHYSICAL_ARMOR_BONUS, ModifierFunction.STATS_STRENGTH_BONUS,ModifierFunction.STATS_AGILITY_BONUS]
    }

    GetModifierBonusStats_Strength(){
        return this.bonus_strength ?? 0;
    }

    GetModifierBonusStats_Agility(){
        return this.bonus_agility ?? 0;
    }

    GetModifierPhysicalArmorBonus(){
        return this.bonus_armor ?? 0;
    }
}