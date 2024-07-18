# Set zinit home directory
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Download zinit if it's not already installed

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "$ZINIT_HOME/zinit.zsh"

# Load Starship prompt
eval "$(starship init zsh)"

# Load zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# Set zsh history options
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Set key bindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# Set key bindings for history search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Make auto-completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Display colors in auto-completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disable default completion menu
zstyle ':completion:*' menu no

# Preview folders
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Aliases
alias sc="source ~/.zshrc"
alias ec="code ~/.zshrc"	
alias mf="make -j"
alias cls="clear"
alias gc="git clone"
alias gck="git checkout"
alias gp="git pull"
alias lg="lazygit"
alias ca="conda activate"
alias tc="typo_checker"
alias aes="python $HOME/Documents/Projects/AES_256-Python/src/AES.py"
alias nvi="nvitop -m full"
alias sn="shutdown now"
alias tc="typst c"
alias tw="typst w"
alias ebeam="code ~/.local/share/typst/packages/local/beamer/1.0.0/beamer.typ"
alias epaper="code ~/.local/share/typst/packages/local/paper/1.0.0/paper.typ"
alias eposter="code ~/.local/share/typst/packages/local/poster/1.0.0/poster.typ"
alias borelli="cd $HOME/Borelli"
alias pipi="pip install"
alias ytmusic="xattr -d com.apple.quarantine /Applications/YouTube\ Music.app"
alias po="poweroff"
alias events="code ~/.LeanCal/events.txt"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:$HOME/.local/lib