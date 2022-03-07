import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";
import { modifier_item_elven_cloak_buff } from "../modifiers/modifier_item_elven_cloak_buff";
@registerModifier()
export class modifier_item_elven_cloak extends BaseModifier
{
    bonus_agility ? :number;
    bonus_strength ?:number;
    bonus_armor ?: number;
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
            this.bonus_agility = ability.GetSpecialValueFor("bonus_agility")
            this.bonus_strength = ability.GetSpecialValueFor("bonus_strength")
            this.bonus_armor = ability.GetSpecialValueFor("bonus_armor")
            this.proc_chance = ability.GetSpecialValueFor("proc_chance")
            this.duration = ability.GetSpecialValueFor("buff_duration")
        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.PHYSICAL_ARMOR_BONUS, ModifierFunction.STATS_STRENGTH_BONUS,ModifierFunction.STATS_AGILITY_BONUS, ModifierFunction.PROCATTACK_FEEDBACK ]
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

    GetModifierProcAttack_Feedback()
    {
        if (IsServer())
        {
            if (this.proc_chance)
            {
                if (Math.floor(Math.random()*100)<this.proc_chance)
                {
                    this.GetParent().AddNewModifier(this.GetParent(),this.GetAbility(), modifier_item_elven_cloak_buff.name,{duration:this.duration})
                    return 0
                }
            }
            return 0
        }
        return 0
    }
}