--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 6,["16"] = 9,["17"] = 10,["18"] = 9,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 13,["23"] = 18,["24"] = 19,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 25,["29"] = 25,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["36"] = 18,["37"] = 30,["38"] = 31,["39"] = 33,["40"] = 34,["41"] = 35,["42"] = 37,["43"] = 38,["46"] = 30,["47"] = 44,["48"] = 45,["49"] = 46,["50"] = 47,["51"] = 49,["54"] = 53,["55"] = 53,["56"] = 55,["57"] = 56,["58"] = 58,["60"] = 53,["63"] = 62,["64"] = 44,["65"] = 6,["67"] = 5,["69"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_decay_tome = require("modifiers.modifier_item_decay_tome")
local modifier_item_decay_tome = ____modifier_item_decay_tome.modifier_item_decay_tome
local ____modifier_item_decay_tome_debuff = require("modifiers.modifier_item_decay_tome_debuff")
local modifier_item_decay_tome_debuff = ____modifier_item_decay_tome_debuff.modifier_item_decay_tome_debuff
____exports.item_decay_tome = __TS__Class()
local item_decay_tome = ____exports.item_decay_tome
item_decay_tome.name = "item_decay_tome"
__TS__ClassExtends(item_decay_tome, BaseItem)
function item_decay_tome.prototype.GetIntrinsicModifierName(self)
    return modifier_item_decay_tome.name
end
function item_decay_tome.prototype.OnOwnerSpawned(self)
    local required_level = self:GetSpecialValueFor("required_level")
    local gear_type = self:GetSpecialValueFor("gear_type")
end
function item_decay_tome.prototype.OnSpellStart(self)
    if IsServer() then
        self.duration = self:GetSpecialValueFor("buff_duration")
        local target = self:GetCursorTarget()
        if target then
            target:AddNewModifier(
                self:GetCaster(),
                self,
                modifier_item_decay_tome_debuff.name,
                {duration = self.duration}
            )
        end
    end
end
function item_decay_tome.prototype.OnHeroLevelUp(self)
    if IsServer() then
        local required_level = self:GetSpecialValueFor("required_level")
        local gear_type = self:GetSpecialValueFor("gear_type")
        if (self:GetCaster():GetLevel() == required_level) and self:IsInBackpack() then
            self:OnUnequip()
            self:OnEquip()
        end
    end
end
function item_decay_tome.prototype.CanUnitPickUp(self, unit)
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
item_decay_tome = __TS__Decorate(
    {
        registerAbility(nil)
    },
    item_decay_tome
)
return ____exports
