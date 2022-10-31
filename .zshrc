source ~/.zplug/init.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
#
# plugins
zplug 'hlissner/zsh-autopair'

zplug "zsh-users/zsh-syntax-highlighting", defer:2 #must be the last one
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

plugins=(
git
zsh-completions
zsh-autosuggestions
zsh-syntax-highlighting
web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ------------------------------------------Alias------------------------------------------
#alias vim="vim -S ~/.vimrc"
alias oj='python2.7 /home/edison/oj-cli/oj'
# 加上 -r 在刪除/複製目錄時才不會跳警告
alias rm='rm -r'
alias cp='cp -r'

# -h 可以把檔案大小加上適當的單位，比較好讀
# -l 印出除了檔名其他的資訊，ex：權限、大小
# -F、--color 純粹是好看
alias ll='ls -hlF --color=auto'
alias lla='ls -la'
# alias lla='ls -lahF --color=auto'

# 大推，這個 alias 非常好用（zsh 有類似功能的外掛可以裝，但是我覺得可以用 alias 就用 alias
alias ..='cd ..'

# 把當前目錄下的檔案/目錄以樹狀結構印出來，會把不重要的（.git, node_modules）忽略，後面可以接路徑
alias tree="tree -alI 'node_modules|.git'"

# 加上顏色
alias grep='grep --color=always'

# 超好用，在當前目錄中所有檔案中找指定字串，用法：grepFind 'console.log'，會印出檔案行號，還會把目標字串上色
alias grepFind='grep --exclude-dir=node_modules -nr . -e'

# 建立巢狀目錄時會一並建立上層目錄，下面解釋
alias mkdir='mkdir -p'

alias sub='oj submit'
alias sub-p='oj submit_p'
# Git
alias g='git'
alias gst='git status'
# 基礎四步驟 add commit push pull
alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gf='git fetch'
alias gps='git push'
alias gpl='git pull'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.visual '!gitk.exe'
git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Ignore lower upper
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Command line alias to start the browser-sync server
alias serve="browser-sync start --server --files ."

leet(){
    mkdir -p "$@" && cd "$@" && vim "$@.cpp"
}
# ------------------------------------------Alias------------------------------------------
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

# ------------------------------------------AutoJump------------------------------------------
[[ -s /home/edison/.autojump/etc/profile.d/autojump.sh ]] && source /home/edison/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
# ------------------------------------------AutoJump------------------------------------------

# Fix prompt at the bottom of the terminal window
printf '\n%.0s' {1..100}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
