export ZSH_CACHE_DIR="~/.cache/zsh"

ZDOTDIR=$HOME/.config/zsh

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=1000000000
SAVEHIST=1000000000

autoload -U colors && colors
autoload -U compinit; compinit
autoload -Uz zmv
zmodload -i zsh/complist

source ${ZDOTDIR}/plugins/lscolors.sh
source ${ZDOTDIR}/plugins/completion.zsh

source ~/.config/fzf/key-bindings.zsh
source ~/.config/fzf/completion.zsh
source ${ZDOTDIR}/plugins/fzf-tab/fzf-tab.plugin.zsh

source ${ZDOTDIR}/plugins/zsh-completions/zsh-completions.plugin.zsh
source ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bash-backward-kill-word() {
	local WORDCHARS=''
	zle .backward-kill-word
}

autoload -U down-line-or-beginning-search
autoload -U up-line-or-beginning-search
bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey -v
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# bindkey "^[[3~"   delete-char
# bindkey "^[[A"    up-line-or-beginning-search 
# bindkey "^[[B"    down-line-or-beginning-search 
# bindkey "^[[F"    end-of-line
# bindkey "^[[H"    beginning-of-line
# bindkey "^[^?" bash-backward-kill-word 
zle -N bash-backward-kill-word
zle -N down-line-or-beginning-search
zle -N up-line-or-beginning-search

unsetopt flowcontrol
unsetopt menu_complete

setopt always_to_end
setopt appendhistory
setopt auto_cd
setopt auto_menu
setopt auto_pushd
setopt bang_hist                 
setopt complete_in_word
setopt extended_glob
setopt extended_history           
setopt hist_expire_dups_first    
setopt hist_find_no_dups         
setopt hist_ignore_all_dups      
setopt hist_ignore_dups          
setopt hist_ignore_space         
setopt hist_reduce_blanks        
setopt hist_save_no_dups         
setopt hist_verify    
setopt inc_append_history
setopt interactivecomments
setopt localoptions nopromptsubst
setopt long_list_jobs
setopt multios
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushdminus
setopt share_history         

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' special-dirs false

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:vim:*' fzf-preview 'bat --theme=OneHalfDark --style=numbers --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
setopt glob_dots

alias mv='nocorrect mv'
alias cp='nocorrect cp'       
alias mkdir='nocorrect mkdir'

source ~/.shellrc

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"
