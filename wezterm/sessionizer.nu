def sessionizer [] {
    let folders = [~/projects ~/projects/proxy-ta-mere ~/projects/holistic-coders]
        | filter {|el| path exists }
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

    let basename = $selected | path basename

    let id = wezterm cli spawn --cwd $selected

    wezterm cli set-tab-title $basename --pane-id $id
}

sessionizer

