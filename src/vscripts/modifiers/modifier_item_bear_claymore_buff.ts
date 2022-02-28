import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_bear_claymore_buff extends BaseModifier
{
    bonus_strength_buff ?:number;
    bonus_hp_regen_buff ?:number;


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
            this.bonus_strength_buff = ability.GetSpecialValueFor("bonus_strength_buff");
            this.bonus_hp_regen_buff = ability.GetSpecialValueFor("bonus_hp_regen_buff");

        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.STATS_STRENGTH_BONUS,
        ModifierFunction.HEALTH_REGEN_CONSTANT]
    }


    GetModifierConstantHealthRegen(){
        return this.bonus_hp_regen_buff ?? 0;
    }

    GetModifierBonusStats_Strength(){
        return this.bonus_strength_buff ?? 0;
    }

}