import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modidifier_item_crown_of_insight extends BaseModifier
{
    bonus_int ?:number;
    bonus_armor ?:number;
    bonus_mana_regen ?:number;
    proc_chance ?:number;
    mana_proc ?:number;

    IsHidden(): boolean {
        return true
    }

    IsPurgable(): boolean {
        return true
    }

    OnCreated(params: object): void {
        const ability = this.GetAbility()
        if (ability)
        {
            this.bonus_int = ability.GetSpecialValueFor("bonus_int");
            this.bonus_armor = ability.GetSpecialValueFor("bonus_armor")
            this.bonus_mana_regen = ability.GetSpecialValueFor("bonus_mana_regen")
            this.proc_chance = ability.GetSpecialValueFor("proc_chance")
            this.mana_proc = ability.GetSpecialValueFor("mana_proc")
        }
    }

    DeclareFunctions()
    {
        return [ModifierFunction.STATS_INTELLECT_BONUS, ModifierFunction.PHYSICAL_ARMOR_BONUS, ModifierFunction.MANA_REGEN_CONSTANT]
    }


    GetModifierBonusStats_Intellect()
    {
        return this.bonus_int ?? 0;
    }

    GetModifierPhysicalArmorBonus()
    {
        return this.bonus_armor ?? 0;
    }

    GetModifierConstantManaRegen()
    {
        return this.bonus_mana_regen ?? 0;
    }

    OnSpentMana()
    {
        if (IsServer())
        {
            if (this.proc_chance)
            {
                if (Math.floor(Math.random()*100)<this.proc_chance)
                {
                    this.GetParent().GiveMana(this.mana_proc ?? 0)
                }
            }
        }
    }
}