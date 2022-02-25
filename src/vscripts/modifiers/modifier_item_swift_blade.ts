import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class modifier_item_swift_blade extends BaseModifier
{
    bonus_agility ?:number;
    bonus_damage ?:number;
    bonus_attack_speed ?:number;
    bonus_agility_damage ?:number;
    proc_chance ?:number;
    record ?: any;

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
            this.bonus_agility = ability.GetSpecialValueFor("bonus_agility");
            this.bonus_damage = ability.GetSpecialValueFor("bonus_damage");
            this.bonus_attack_speed = ability.GetSpecialValueFor("bonus_attack_speed")
            this.bonus_agility_damage = ability.GetSpecialValueFor("bonus_agility_damage");
            this.proc_chance = ability.GetSpecialValueFor("proc_chance");
        }
    }

    DeclareFunctions() {
        return [ModifierFunction.STATS_AGILITY_BONUS, 
            ModifierFunction.PREATTACK_BONUS_DAMAGE, 
            ModifierFunction.ATTACKSPEED_BONUS_CONSTANT, 
            ModifierFunction.PROCATTACK_FEEDBACK,
            ModifierFunction.PROCATTACK_BONUS_DAMAGE_PHYSICAL,
            ModifierFunction.PROCATTACK_FEEDBACK ];
    }

    GetModifierBonusStats_Agility()
    {
        return this.bonus_agility ?? 0;
    }

    GetModifierPreAttack_BonusDamage()
    {
        return this.bonus_damage ?? 0;
    }

    GetModifierAttackSpeedBonus_Constant()
    {
        return this.bonus_attack_speed ?? 0;
    }

    GetModifierProcAttack_BonusDamage_Physical( params:any )
    {
        if (this.proc_chance)
        {
            if (Math.floor(Math.random()*100)<this.proc_chance)
            {
                if (this.GetParent().IsHero() )
                {
                    this.record = params.record
                    const agi_proc:number = ((this.GetParent() as CDOTA_BaseNPC_Hero).GetAgility())
                    return (this.bonus_agility_damage ?? 0) * agi_proc;
                }
            }
            return 0
        }
        return 0
    }

    GetModifierProcAttack_Feedback(params:any)
    {
        if (IsServer())
        {
            if (this.record &&  this.record == params.record)
            {
                this.record = null
                const sound:string = "Hero_Juggernaut.BladeDance"
                const particle_cast:string = "particles/generic_gameplay/generic_manaburn.vpcf"
                EmitSoundOn(sound, params.target)
                const effect_cast:any = ParticleManager.CreateParticle( particle_cast, 0, params.target )
            }
        }
        return 0
    }


}