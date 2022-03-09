import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_porevit_ring_buff extends BaseModifier
{
    bonus_armor_buff ?:number;
    bonus_magic_res_buff ?:number;
    heal_buff ?:number;
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
            this.bonus_armor_buff = ability.GetSpecialValueFor("bonus_armor_buff")
            this.bonus_magic_res_buff = ability.GetSpecialValueFor("bonus_magic_res_buff")
            this.heal_buff = ability.GetSpecialValueFor("heal_buff")
        }
        this.GetParent().Heal(this.heal_buff ?? 0,ability)
    }

    DeclareFunctions()
    {
        return [ModifierFunction.PHYSICAL_ARMOR_BONUS, ModifierFunction.MAGICAL_RESISTANCE_BONUS]
    }

    GetModifierPhysicalArmorBonus()
    {
        return this.bonus_armor_buff ?? 0;
    }

    GetModifierMagicalResistanceBonus()
    {
        return this.bonus_magic_res_buff ?? 0;
    }
}