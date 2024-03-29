# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:/home/inaki/dotfiles/my_bin:/home/inaki/.local/bin"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/inaki/.local/share/flatpak/exports/share"

# Path to your oh-my-zsh installation.
export ZSH="/home/inaki/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         zsh-autosuggestions
         zsh-syntax-highlighting)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load mtime at bash start-up
#echo "bashrc mtime: $(stat -f "%m" ~/.bashrc)" >&2
export ZSHRC_MTIME=$(date -r ~/.zshrc +%s)

#reload the bashrc if it has been changed
#PROMPT_COMMAND="check_and_reload_zshrc"
check_and_reload_zshrc () {
	if [ "$(date -r ~/.zshrc +%s)" != $ZSHRC_MTIME ]; then
		export ZSHRC_MTIME="$(date -r ~/.bashrc +%s)"
		echo "zshrc changed. re-sourcing..." >&2
		source ~/.zshrc
	fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd check_and_reload_zshrc

zstyle ':completion::complete:make:*:targets' call-command true

autoload -Uz compinit
compinit


# export
export XDG_CONFIG_HOME=$HOME/.config

# Set line editing to vim style
bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended"
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fdfind --type file -L --no-ignore-vcs --ignore-file /home/inaki/.fdignore'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind -t d . $HOME"

# Options to fzf command
#export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_OPTS='--extended'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.

#_fzf_compgen_path() {
#  fd --hidden --follow --exclude ".git" --ignore-file ~/.fdignore . "$1"
#}
#
## Use fd to generate the list for directory completion
#_fzf_compgen_dir() {
#  fd --type d --hidden --follow --exclude ".git" --ignore-file ~/.fdignore . "$1"
#}
#
## Advanced customization of fzf options via _fzf_comprun function
## - The first argument to the function is the name of the command.
## - You should make sure to pass the rest of the arguments to fzf.
#_fzf_comprun() {
#  local command=$1
#  shift
#
#  case "$command" in
#    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#    ssh)          fzf --preview 'dig {}'                   "$@" ;;
#    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#  esac
#}

#export TERM=xterm-256color-italic

# Git checkout with fzf
gch() {
 git checkout $(git branch --all | sed "s/remotes\/origin\///" | fzf)
}



#zoxide
eval "$(zoxide init zsh --cmd j)"

source $HOME/.aliases
source $HOME/.zprofile

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
