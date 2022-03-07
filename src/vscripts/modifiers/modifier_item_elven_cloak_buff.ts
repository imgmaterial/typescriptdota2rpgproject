import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_elven_cloak_buff extends BaseModifier
{
    bonus_movespeed_buff ?:number;

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
            this.bonus_movespeed_buff = ability.GetSpecialValueFor("bonus_movespeed_buff")
        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.MOVESPEED_BONUS_CONSTANT]
    }

    GetModifierMoveSpeedBonus_Constant()
    {
        return this.bonus_movespeed_buff ?? 0;
    }

    CheckState(){
        return {[ModifierState.NO_UNIT_COLLISION]:true}
    }
}