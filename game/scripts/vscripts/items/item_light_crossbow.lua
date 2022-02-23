--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 5,["12"] = 4,["13"] = 5,["14"] = 8,["15"] = 9,["16"] = 8,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 13,["21"] = 18,["22"] = 19,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 25,["27"] = 26,["30"] = 18,["31"] = 32,["32"] = 33,["33"] = 34,["34"] = 35,["35"] = 37,["38"] = 41,["39"] = 41,["40"] = 43,["41"] = 44,["42"] = 46,["44"] = 50,["46"] = 41,["49"] = 54,["50"] = 32,["51"] = 5,["53"] = 4,["55"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_light_crossbow = require("modifiers.modifier_item_light_crossbow")
local modifier_item_light_crossbow = ____modifier_item_light_crossbow.modifier_item_light_crossbow
____exports.item_light_crossbow = __TS__Class()
local item_light_crossbow = ____exports.item_light_crossbow
item_light_crossbow.name = "item_light_crossbow"
__TS__ClassExtends(item_light_crossbow, BaseItem)
function item_light_crossbow.prototype.GetIntrinsicModifierName(self)
    return modifier_item_light_crossbow.name
end
function item_light_crossbow.prototype.OnOwnerSpawned(self)
    local required_level = self:GetSpecialValueFor("required_level")
    local gear_type = self:GetSpecialValueFor("gear_type")
end
function item_light_crossbow.prototype.OnHeroLevelUp(self)
    if IsServer() then
        local required_level = self:GetSpecialValueFor("required_level")
        local gear_type = self:GetSpecialValueFor("gear_type")
        if (self:GetCaster():GetLevel() == required_level) and self:IsInBackpack() then
            self:OnUnequip()
            self:OnEquip()
        end
    end
end
function item_light_crossbow.prototype.CanUnitPickUp(self, unit)
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
            else
                return true
            end
            item_slot = item_slot + 1
        end
    end
    return true
end
item_light_crossbow = __TS__Decorate(
    {
        registerAbility(nil)
    },
    item_light_crossbow
)
return ____exports
