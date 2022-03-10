import { BaseItem, registerAbility } from "../lib/dota_ts_adapter";
import { modidifier_item_crown_of_insight } from "../modifiers/modifier_item_crown_of_insight";

@registerAbility()
export class item_crown_of_insight extends BaseItem
{
    GetIntrinsicModifierName(): string {
        return modidifier_item_crown_of_insight.name    
    }

    OnOwnerSpawned(): void {
        const required_level = this.GetSpecialValueFor("required_level");
        const gear_type = this.GetSpecialValueFor("gear_type");
    }

    OnHeroLevelUp(): void {
        if (IsServer()) 
        {
            const required_level = this.GetSpecialValueFor("required_level");
            const gear_type = this.GetSpecialValueFor("gear_type");
            if (this.GetCaster().GetLevel() == required_level && this.IsInBackpack())
            {
                this.OnUnequip()
                this.OnEquip()
            }
        }

    }

    CanUnitPickUp(unit: CDOTA_BaseNPC): boolean {
        const required_level = this.GetSpecialValueFor("required_level");
        const gear_type = this.GetSpecialValueFor("gear_type");
        if (unit.GetLevel() < required_level)
        {
            return false
        }

        
        for (let item_slot:number = 0; item_slot < 6; item_slot++)
        {
            const backpack_gear_type = unit.GetItemInSlot(item_slot)
            if (backpack_gear_type != undefined && backpack_gear_type.GetSpecialValueFor("gear_type") == gear_type)
            {
                return false
            }
        }

        return true
    }
}