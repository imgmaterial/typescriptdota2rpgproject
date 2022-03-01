import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_stone_plates extends BaseModifier
{
    bonus_armor ?:number;
    bonus_strength ?:number;
    damage_reduction ?:number;
    buff_duration ?:number;
    bonus_magic_resist_buff ?:number;

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
            this.bonus_armor = ability.GetSpecialValueFor("bonus_armor");
            this.bonus_strength = ability.GetSpecialValueFor("bonus_strength")
            this.damage_reduction = ability.GetSpecialValueFor("damage_reduction")
            this.buff_duration = ability.GetSpecialValueFor("buff_duration")
            this.bonus_magic_resist_buff = ability.GetSpecialValueFor("bonus_magic_resist_buff")
        }
    }


    DeclareFunctions()
    {
        return [ModifierFunction.PHYSICAL_ARMOR_BONUS,ModifierFunction.STATS_STRENGTH_BONUS, ModifierFunction.INCOMING_DAMAGE_PERCENTAGE]
    }

    GetModifierPhysicalArmorBonus()
    {
        return this.bonus_armor ?? 0;
    }

    GetModifierBonusStats_Strength()
    {
        return this.bonus_strength ?? 0;
    }

    GetModifierIncomingDamage_Percentage()
    {
        return this.damage_reduction ?? 0;
    }



}