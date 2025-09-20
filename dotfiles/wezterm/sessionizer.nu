def sessionizer [] {
    let home = "~/" | path expand

    let folders = zoxide query -l
        | lines
        | each { $in | str replace $home "~" }
        | each { $in | str replace "\\" "/" --all }
        | where { |el| $el | str contains "~/projects" }

    let selected = $folders 
        | to text
        | fzf
        | path expand
        | each { $in | str replace "\\" "/" --all }

    if ($selected | str length) == 0 {
        return
    }

    let tabs = wezterm cli list --format json 
        | from json

    let matching_tabs = $tabs
        | where {|el| $el.cwd | str ends-with $selected}

    let tab_id = $matching_tabs
        | try {first} catch {{tab_id: null}}
        | get tab_id


    if $tab_id == null {
        # Switch to a new tab
        let basename = $selected | path basename
        let id = wezterm cli spawn --cwd $selected
        wezterm cli set-tab-title $basename --pane-id $id
    } else {
        # switch to an existing tab
        wezterm cli activate-tab --tab-id $tab_id
    }
}

sessionizer

