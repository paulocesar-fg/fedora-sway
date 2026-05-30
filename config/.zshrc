# Created by newuser for 5.9
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit
compinit


zstyle ':completion:*' menu select

eval "$(starship init zsh)"
