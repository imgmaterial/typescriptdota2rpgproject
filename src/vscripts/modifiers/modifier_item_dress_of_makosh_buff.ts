import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_dress_of_makosh_buff extends BaseModifier
{
    bonus_evasion_buff ? :number;
    hp_regen_buff ? :number;
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
            this.bonus_evasion_buff = ability.GetSpecialValueFor("bonus_evasion_buff")
            this.hp_regen_buff = ability.GetSpecialValueFor("hp_regen_buff")
        }
    }


    DeclareFunctions()
    {
        return [ModifierFunction.EVASION_CONSTANT, ModifierFunction.HEALTH_REGEN_CONSTANT ]
    }

    GetModifierConstantHealthRegen()
    {
        return this.hp_regen_buff ?? 0;
    }

    GetModifierEvasion_Constant()
    {
        return this.bonus_evasion_buff ?? 0;
    }


}