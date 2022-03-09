import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";
import { modifier_item_porevit_ring_buff } from "./modifier_item_porevit_ring_buff";

@registerModifier()
export class modifier_item_porevit_ring extends BaseModifier
{
    bonus_hp_regen ?:number;
    bonus_health ?:number;
    bonus_strength ?:number;
    proc_chance ?:number;
    duration ?:number;
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
            this.proc_chance = ability.GetSpecialValueFor("proc_chance")
            this.bonus_hp_regen = ability.GetSpecialValueFor("bonus_hp_regen")
            this.bonus_health = ability.GetSpecialValueFor("bonus_health")
            this.bonus_strength = ability.GetSpecialValueFor("bonus_strength")
            this.duration = ability.GetSpecialValueFor("buff_duration")
        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.HEALTH_REGEN_CONSTANT,ModifierFunction.HEALTH_BONUS, ModifierFunction.STATS_STRENGTH_BONUS, ModifierFunction.ON_TAKEDAMAGE]
    }


    OnTakeDamage()
    {
        if (IsServer())
        {
            if (this.proc_chance)
            {
                if (Math.floor(Math.random()*100)<this.proc_chance)
                {
                    this.GetParent().AddNewModifier(this.GetParent(),this.GetAbility(), modifier_item_porevit_ring_buff.name,{duration:this.duration})
                    return 0
                }
            }
        }
    }


    GetModifierBonusStats_Strength()
    {
        return this.bonus_strength ?? 0;
    }

    GetModifierHealthBonus()
    {
        return this.bonus_health ?? 0;
    }

    GetModifierConstantHealthRegen()
    {
        return this.bonus_hp_regen ?? 0;
    }


}