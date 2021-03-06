import { registerAbility, BaseItem } from "../lib/dota_ts_adapter";
import { modifier_item_swift_blade } from "../modifiers/modifier_item_swift_blade";
import { modifier_item_swift_blade_buff } from "../modifiers/modifier_item_swift_blade_buff";

@registerAbility()
export class item_swift_blade extends BaseItem
{
    GetIntrinsicModifierName(): string {
        return modifier_item_swift_blade.name
    }

    OnSpellStart(): void {
        this.GetCaster().AddNewModifier(this.GetCaster(), this, modifier_item_swift_blade_buff.name, {duration : this.GetSpecialValueFor("buff_duration")})
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
