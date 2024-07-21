def sessionizer [] {
    let folders = [~/projects ~/projects/proxy-ta-mere ~/projects/holistic-coders]
        | each { $in | path expand }
        | filter { $in | path exists }
        | each { ls $in --long
            | where type == dir
            | get name
        }
        | reduce {|it, acc| $acc | append $it }

    let selected = $folders 
        | to text
        | fzf

    if ($selected | str length) == 0 {
        return
    }

    let tab_id = wezterm cli list --format json 
        | from json
        | where {|el| ($selected | str replace "\\" "/" --all)  in $el.cwd}
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

