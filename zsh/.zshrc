# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use the Starship Prompt instead of the Oh My Zsh themes
# ZSH_THEME="robbyrussell"
eval "$(starship init zsh)"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

unsetopt autocd # Don't cd in directorys just by typing their names

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/.pyenv/bin/:$PATH
eval "$(pyenv init -)"


# pipx
export PATH="$PATH:/home/muream/.local/bin"
