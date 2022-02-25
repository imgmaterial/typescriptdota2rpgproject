import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_swift_blade_buff extends BaseModifier
{
    bonus_buff_attack_speed ? :number;

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
            this.bonus_buff_attack_speed = ability.GetSpecialValueFor("bonus_buff_attack_speed")
        }
    }

    DeclareFunctions() {
        return [ModifierFunction.ATTACKSPEED_BONUS_CONSTANT]
    }

    GetModifierAttackSpeedBonus_Constant()
    {
        return this.bonus_buff_attack_speed ?? 0;
    }

}