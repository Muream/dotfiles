local reload = require("core.reload")
reload.unload_user_modules()

local log = require("core.log")
log.init()

local layer = require("core.layer")

layer.add_layer("layer.editor")
layer.add_layer("layer.style")
layer.add_layer("layer.file_man")
layer.add_layer("layer.vcs")
layer.add_layer("layer.lsp")
layer.add_layer("layer.lua")
layer.add_layer("layer.python")
layer.add_layer("layer.rust")
layer.finish_layer_registration()
