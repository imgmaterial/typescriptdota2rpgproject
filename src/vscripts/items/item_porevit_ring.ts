import { BaseItem, registerAbility } from "../lib/dota_ts_adapter";
import { modifier_item_porevit_ring } from "../modifiers/modifier_item_porevit_ring";

@registerAbility()
export class item_porevit_ring extends BaseItem
{
    GetIntrinsicModifierName(): string {
        return modifier_item_porevit_ring.name
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