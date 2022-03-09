--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 5,["12"] = 4,["13"] = 5,["14"] = 7,["15"] = 8,["16"] = 7,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 11,["21"] = 16,["22"] = 17,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 23,["27"] = 24,["30"] = 16,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 33,["35"] = 35,["38"] = 39,["39"] = 39,["40"] = 41,["41"] = 42,["42"] = 44,["44"] = 39,["47"] = 48,["48"] = 30,["49"] = 5,["51"] = 4,["53"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_porevit_ring = require("modifiers.modifier_item_porevit_ring")
local modifier_item_porevit_ring = ____modifier_item_porevit_ring.modifier_item_porevit_ring
____exports.item_porevit_ring = __TS__Class()
local item_porevit_ring = ____exports.item_porevit_ring
item_porevit_ring.name = "item_porevit_ring"
__TS__ClassExtends(item_porevit_ring, BaseItem)
function item_porevit_ring.prototype.GetIntrinsicModifierName(self)
    return modifier_item_porevit_ring.name
end
function item_porevit_ring.prototype.OnOwnerSpawned(self)
    local required_level = self:GetSpecialValueFor("required_level")
    local gear_type = self:GetSpecialValueFor("gear_type")
end
function item_porevit_ring.prototype.OnHeroLevelUp(self)
    if IsServer() then
        local required_level = self:GetSpecialValueFor("required_level")
        local gear_type = self:GetSpecialValueFor("gear_type")
        if (self:GetCaster():GetLevel() == required_level) and self:IsInBackpack() then
            self:OnUnequip()
            self:OnEquip()
        end
    end
end
function item_porevit_ring.prototype.CanUnitPickUp(self, unit)
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
item_porevit_ring = __TS__Decorate(
    {
        registerAbility(nil)
    },
    item_porevit_ring
)
return ____exports
