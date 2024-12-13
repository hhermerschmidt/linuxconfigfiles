export LANG=en_GB.UTF-8
export ARCHFLAGS="-arch x86_64"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export ZSH_CACHE_DIR="~/.cache/zsh"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

zmodload -i zsh/complist

bash-backward-kill-word() {
	local WORDCHARS=''
	zle .backward-kill-word
}

zle -N bash-backward-kill-word
bindkey "^[^?" bash-backward-kill-word 
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search 
bindkey "^[[B" down-line-or-beginning-search 

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

bindkey -M menuselect '^o' accept-and-infer-next-history

setopt localoptions nopromptsubst
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
#setopt correct_all
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt extended_history      
setopt hist_expire_dups_first
setopt hist_ignore_dups      
setopt hist_ignore_space     
setopt hist_verify           
setopt share_history         
setopt long_list_jobs
setopt interactivecomments
setopt localoptions nopromptsubst
setopt extended_glob
setopt auto_cd
setopt multios
setopt prompt_subst

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
autoload -U colors && colors
autoload -Uz zmv

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR


alias ls='eza'
alias l='eza -lbF --git --icons=auto --no-user --no-permissions'
alias ll='eza -lbF --git --icons=auto'
alias la='eza -lbaF --git --color-scale --icons=auto'

#alias la='ls -alh'				# zeige auch versteckte Dateien
#alias lsa='ls -ldh .*'				# zeige nur versteckte Dateien
#alias l="ls -lh --group-directories-first"	# ls als Liste, Verzeichnisse ganz oben
#alias ll="ls -alh --group-directories-first"	# ls als Liste, Verzeichnisse ganz oben
# alias ls='ls -Fh --color=always'		# Farbige Liste + Dateiendungen anzeigen
# alias lx='ls -lXBh'				# Sortierung nach Endung
# alias lk='ls -lSrh'				# Sortierung nach Grösse
# alias lc='ls -lcrh'				# Sortierung nach Änderungsdatum   
# alias lu='ls -lurh'				# Sortierung nach letztem Zugriff
# alias lt='ls -ltrh'				# Sortierung nach Datum

alias mv='nocorrect mv'       			# Keine TypoKorrektur
alias cp='nocorrect cp'       
alias mkdir='nocorrect mkdir' 

alias cd="z"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias  fvim='vim $(fzf --preview="bat --color=always --theme=OneHalfDark --style=numbers {}")'
alias cat=bat

expand-or-complete-with-dots() {
 echo -n "\e[31m......\e[0m"
 zle expand-or-complete
 zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='code'
fi

export PYENV_ROOT="$HOME/Software/pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source ~/.magmarc

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/data/home/h.hermerschmidt_dev/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

export GOPROXY=https://artifacts.dev.corpdir.zz/repository/go-proxy
export GOSUMDB=off

source ~/.config/fzf/key-bindings.zsh
source ~/.config/fzf/completion.zsh

export TERM=xterm-kitty

eval "$(zoxide init zsh)"

bindkey -v
