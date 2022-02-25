--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 6,["16"] = 8,["17"] = 9,["18"] = 8,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 12,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 17,["33"] = 22,["34"] = 23,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 29,["39"] = 30,["42"] = 22,["43"] = 36,["44"] = 37,["45"] = 38,["46"] = 39,["47"] = 41,["50"] = 45,["51"] = 45,["52"] = 47,["53"] = 48,["54"] = 50,["56"] = 45,["59"] = 54,["60"] = 36,["61"] = 6,["63"] = 5,["65"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local BaseItem = ____dota_ts_adapter.BaseItem
local ____modifier_item_swift_blade = require("modifiers.modifier_item_swift_blade")
local modifier_item_swift_blade = ____modifier_item_swift_blade.modifier_item_swift_blade
local ____modifier_item_swift_blade_buff = require("modifiers.modifier_item_swift_blade_buff")
local modifier_item_swift_blade_buff = ____modifier_item_swift_blade_buff.modifier_item_swift_blade_buff
____exports.item_swift_blade = __TS__Class()
local item_swift_blade = ____exports.item_swift_blade
item_swift_blade.name = "item_swift_blade"
__TS__ClassExtends(item_swift_blade, BaseItem)
function item_swift_blade.prototype.GetIntrinsicModifierName(self)
    return modifier_item_swift_blade.name
end
function item_swift_blade.prototype.OnSpellStart(self)
    self:GetCaster():AddNewModifier(
        self:GetCaster(),
        self,
        modifier_item_swift_blade_buff.name,
        {
            duration = self:GetSpecialValueFor("buff_duration")
        }
    )
end
function item_swift_blade.prototype.OnOwnerSpawned(self)
    local required_level = self:GetSpecialValueFor("required_level")
    local gear_type = self:GetSpecialValueFor("gear_type")
end
function item_swift_blade.prototype.OnHeroLevelUp(self)
    if IsServer() then
        local required_level = self:GetSpecialValueFor("required_level")
        local gear_type = self:GetSpecialValueFor("gear_type")
        if (self:GetCaster():GetLevel() == required_level) and self:IsInBackpack() then
            self:OnUnequip()
            self:OnEquip()
        end
    end
end
function item_swift_blade.prototype.CanUnitPickUp(self, unit)
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
item_swift_blade = __TS__Decorate(
    {
        registerAbility(nil)
    },
    item_swift_blade
)
return ____exports
