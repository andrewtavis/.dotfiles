# Set up the prompt:

export PROMPT="%2~ %F{yellow}»%f "

bindkey -e

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
HISTDUP=erase

# Completion:

autoload -U compinit
compinit
_comp_options+=(globdots) # with hidden files

# Plugins:

if [[ $(uname) == "Darwin" ]]; then
  source /Users/$USER/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /Users/$USER/.zsh/zsh-autosuggetions/zsh-autosuggestions.zsh
else
  source /home/$USER/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /home/$USER/.zsh/zsh-autosuggetions/zsh-autosuggestions.zsh
fi

# Custom functions:

autoload -U compinit
compinit

mkcd() {
  mkdir -p "$1"
  cd "$1"
}

tode() {
  touch "$1"
  code "$1"
}

# Custom bindings:

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

if [[ $(uname) == "Darwin" ]]; then
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
else
  bindkey "^[OA" history-beginning-search-backward
  bindkey "^[OB" history-beginning-search-forward
fi

# Custom aliases:

alias brewup='brew update && brew upgrade && brew cleanup'
alias python='python3'

alias mkdir='mkdir -pv'
alias run='./run'

if [[ $(uname) == "Darwin" ]]; then
  alias ls='gls -l --group-directories-first --color=auto'
else
  alias ls='ls --group-directories-first --color=auto'
fi

alias ll='ls -lahF'

alias grep="grep -P -i --color=auto"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias gst='git status'
alias ga='git add'
alias gaa='git add -a'
alias gau='git add -u'
alias gb='git branch'
alias gp='git push'
alias gpo='git push origin'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gc='git commit'
alias gcmsg='git commit -m'

alias jup='jupyter notebook'
