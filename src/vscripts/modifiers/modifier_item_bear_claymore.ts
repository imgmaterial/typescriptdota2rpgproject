import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";
import { modifier_item_bear_claymore_buff } from "./modifier_item_bear_claymore_buff";

@registerModifier()
export class modifier_item_bear_claymore extends BaseModifier
{   
    bonus_strength ? :number;
    bonus_damage ? :number;
    bonus_attack_speed ? :number;
    buff_duration ?:number;

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
            this.bonus_strength = ability.GetSpecialValueFor("bonus_strength");
            this.bonus_damage = ability.GetSpecialValueFor("bonus_damage");
            this.bonus_attack_speed = ability.GetSpecialValueFor("bonus_attack_speed");
            this.buff_duration = ability.GetSpecialValueFor("bonus_duration")
        }
    }

    DeclareFunctions() {
        return [ModifierFunction.STATS_STRENGTH_BONUS, 
            ModifierFunction.PREATTACK_BONUS_DAMAGE, 
            ModifierFunction.ATTACKSPEED_BONUS_CONSTANT,
            ModifierFunction.ON_ABILITY_EXECUTED];
    }

    GetModifierPreAttack_BonusDamage(){
        return this.bonus_damage ?? 0;
    }

    GetModifierExtraStrengthBonus(){
        return this.bonus_strength ?? 0;
    }

    GetModifierAttackSpeedBonus_Constant()
    {
        return (this.bonus_attack_speed ?? 0);
    }

    OnAbilityExecuted(params:any){
        if (!IsServer()) {}
        if (!params.ability){}
        if (params.ability.IsItem()||params.ability.IsToggle()){}
        
        this.GetParent().AddNewModifier(this.GetParent(), this.GetAbility(), modifier_item_bear_claymore_buff.name, {duration : this.buff_duration} )
        
            


        
    }

}