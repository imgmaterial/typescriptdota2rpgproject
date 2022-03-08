import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";
import { modifier_item_dress_of_makosh_buff } from "../modifiers/modifier_item_dress_of_makosh_buff";


@registerModifier()
export class modifier_item_dress_of_makosh extends BaseModifier
{
    bonus_armor ? :number;
    bonus_strength ?:number;
    bonus_agility ?:number;
    bonus_evasion ?:number;
    duration ?:number;
    cooldown ?:number;
    proc_hp ?:number;

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
            this.bonus_armor = ability.GetSpecialValueFor("bonus_armor")
            this.bonus_strength = ability.GetSpecialValueFor("bonus_strength")
            this.bonus_agility = ability.GetSpecialValueFor("bonus_agility")
            this.bonus_evasion = ability.GetSpecialValueFor("bonus_evasion")
            this.duration = ability.GetSpecialValueFor("buff_duration")
            this.cooldown = ability.GetSpecialValueFor("buff_cooldown")
            this.proc_hp = ability.GetSpecialValueFor("proc_hp")/100
        }
    }



    DeclareFunctions(){
        return [ModifierFunction.EVASION_CONSTANT,ModifierFunction.PHYSICAL_ARMOR_BONUS, ModifierFunction.STATS_STRENGTH_BONUS,ModifierFunction.STATS_AGILITY_BONUS,ModifierFunction.ON_TAKEDAMAGE]
    }


    OnTakeDamage(params:object)
    {   
        if (IsServer())
        {
            const parent = this.GetParent()
            const ability = this.GetAbility()
            const proc_hp_point = this.proc_hp ?? 0
            if (ability?.IsCooldownReady())
            {
                if (parent.GetHealth() < parent.GetMaxHealth()*proc_hp_point)
                {
                    parent.AddNewModifier(parent, this.GetAbility(), modifier_item_dress_of_makosh_buff.name, {duration: this.duration })
                    this.GetAbility()?.StartCooldown(this.cooldown ?? 0)
                }
            }
        }
    }

    GetModifierEvasion_Constant()
    {
        return this.bonus_evasion ?? 0;
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