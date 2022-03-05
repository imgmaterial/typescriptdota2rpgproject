--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 6,["16"] = 11,["17"] = 12,["18"] = 11,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 21,["23"] = 22,["24"] = 23,["26"] = 17,["27"] = 30,["28"] = 31,["29"] = 32,["30"] = 30,["31"] = 35,["32"] = 36,["33"] = 38,["34"] = 39,["35"] = 40,["36"] = 42,["37"] = 43,["40"] = 35,["41"] = 49,["42"] = 50,["43"] = 51,["44"] = 52,["45"] = 54,["48"] = 58,["49"] = 58,["50"] = 60,["51"] = 61,["52"] = 63,["54"] = 58,["57"] = 67,["58"] = 49,["59"] = 6,["61"] = 5,["63"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_stone_plates = require("modifiers.modifier_item_stone_plates")
local modifier_item_stone_plates = ____modifier_item_stone_plates.modifier_item_stone_plates
local ____modifier_item_stone_plates_buff = require("modifiers.modifier_item_stone_plates_buff")
local modifier_item_stone_plates_buff = ____modifier_item_stone_plates_buff.modifier_item_stone_plates_buff
____exports.item_stone_plates = __TS__Class()
local item_stone_plates = ____exports.item_stone_plates
item_stone_plates.name = "item_stone_plates"
__TS__ClassExtends(item_stone_plates, BaseItem)
function item_stone_plates.prototype.GetIntrinsicModifierName(self)
    return modifier_item_stone_plates.name
end
function item_stone_plates.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    if IsServer() then
        caster:Purge(false, false, false, true, false)
        self.duration = self:GetSpecialValueFor("buff_duration")
        caster:AddNewModifier(caster, self, modifier_item_stone_plates_buff.name, {duration = self.duration})
    end
end
function item_stone_plates.prototype.OnOwnerSpawned(self)
    local required_level = self:GetSpecialValueFor("required_level")
    local gear_type = self:GetSpecialValueFor("gear_type")
end
function item_stone_plates.prototype.OnHeroLevelUp(self)
    if IsServer() then
        local required_level = self:GetSpecialValueFor("required_level")
        local gear_type = self:GetSpecialValueFor("gear_type")
        if (self:GetCaster():GetLevel() == required_level) and self:IsInBackpack() then
            self:OnUnequip()
            self:OnEquip()
        end
    end
end
function item_stone_plates.prototype.CanUnitPickUp(self, unit)
    local required_level = self:GetSpecialValueFor("required_level")
    local gear_type = self:GetSpecialValueFor("gear_type")
    if unit:GetLevel() < required_level then
        return false
    end
    do
        local item_slot = 0
        while item_slot < 6 do
            local backpack_gear_type = unit:GetItemInSlot(item_slot)
            if (backpack_gear_type ~= nil) and (backpack_gear_type:GetSpecialValueFor("gear_type") == gear_type) then
                return false
            end
            item_slot = item_slot + 1
        end
    end
    return true
end
item_stone_plates = __TS__Decorate(
    {
        registerAbility(nil)
    },
    item_stone_plates
)
return ____exports
