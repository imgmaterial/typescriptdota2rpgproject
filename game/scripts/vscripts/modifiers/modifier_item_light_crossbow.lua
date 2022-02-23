--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 3,["11"] = 4,["12"] = 4,["14"] = 3,["16"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_light_crossbow = __TS__Class()
local modifier_item_light_crossbow = ____exports.modifier_item_light_crossbow
modifier_item_light_crossbow.name = "modifier_item_light_crossbow"
__TS__ClassExtends(modifier_item_light_crossbow, BaseModifier)
modifier_item_light_crossbow = __TS__Decorate(
    {
        registerModifier(nil)
    },
    modifier_item_light_crossbow
)
return ____exports
