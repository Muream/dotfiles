local reload = require("config.reload")
reload.unload_user_modules()

local log = require("config.log")
log.init()

local layer = require("config.layer")

layer.add_layer("layer.editor")
layer.add_layer("layer.style")
layer.add_layer("layer.lsp")
layer.add_layer("layer.lua")
layer.finish_layer_registration()
