
import * as React from "D:\\PERSONAL\\software\\Oni\\resources\\app\\node_modules\\react"
import * as Oni from "D:\\PERSONAL\\software\\Oni\\resources\\app\\node_modules\\oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    oni.input.bind("<c-h>", () => oni.editors.activeEditor.neovim.command(`call OniNextWindow('h')<CR>`))
    oni.input.bind("<c-j>", () => oni.editors.activeEditor.neovim.command(`call OniNextWindow('j')<CR>`))
    oni.input.bind("<c-k>", () => oni.editors.activeEditor.neovim.command(`call OniNextWindow('k')<CR>`))
    oni.input.bind("<c-l>", () => oni.editors.activeEditor.neovim.command(`call OniNextWindow('l')<CR>`))

    const bufferPathBarItem = oni.statusBar.createItem(0, "bufferPath")
    bufferPathBarItem.show()
    const updatePath = () => {
        const path = oni.editors.activeEditor.activeBuffer.filePath
        bufferPathBarItem.setContents(path)
    }
    oni.editors.anyEditor.onBufferEnter.subscribe((buffer) => {
        updatePath()
    })
    // oni.editors.anyEditor.onBufferChanged.subscribe((buffer) => {
    //     console.warn("buffer changed", buffer)
    //     updatePath()
    // })
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    "oni.useDefaultConfig": true,
    // "oni.loadInitVim": true,
    "oni.loadInitVim": "~/github/dotfiles/nvim/oni.vim",
    "oni.hideMenu": true,

    "editor.fontSize": "15px",
    "editor.fontFamily": "Source Code Pro",
    // "editor.split.mode": "oni",
    "autoClosingPairs.enabled": false

    "ui.colorscheme": "onedark",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    "tabs.mode": "buffer",
    "tabs.wrap": true,
    "tabs.showIndex": true,
    "statusbar.priority": {
        "oni.status.bufferPath": -1,
        "oni.status.workingDirectory": 0,
        "oni.status.linenumber": 2,
        "oni.status.gitHubRepo": 0,
        "oni.status.mode": 1,
        "oni.status.filetype": 1,
        "oni.status.git": 3,
    },
    "experimental.markdownPreview.enabled": true,
}
