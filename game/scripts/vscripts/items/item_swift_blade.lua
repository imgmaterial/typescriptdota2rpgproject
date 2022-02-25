--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 5,["12"] = 4,["13"] = 5,["14"] = 7,["15"] = 8,["16"] = 7,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 12,["21"] = 17,["22"] = 18,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 24,["27"] = 25,["30"] = 17,["31"] = 31,["32"] = 32,["33"] = 33,["34"] = 34,["35"] = 36,["38"] = 40,["39"] = 40,["40"] = 42,["41"] = 43,["42"] = 45,["44"] = 40,["47"] = 49,["48"] = 31,["49"] = 5,["51"] = 4,["53"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local BaseItem = ____dota_ts_adapter.BaseItem
local ____modifier_item_swift_blade = require("modifiers.modifier_item_swift_blade")
local modifier_item_swift_blade = ____modifier_item_swift_blade.modifier_item_swift_blade
____exports.item_swift_blade = __TS__Class()
local item_swift_blade = ____exports.item_swift_blade
item_swift_blade.name = "item_swift_blade"
__TS__ClassExtends(item_swift_blade, BaseItem)
function item_swift_blade.prototype.GetIntrinsicModifierName(self)
    return modifier_item_swift_blade.name
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
