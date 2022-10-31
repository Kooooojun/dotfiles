# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export PATH="/usr/local/sbin:$PATH"
export EDITOR=/usr/bin/vim
source ~/.zplug/init.zsh
source ~/.bash_profile
# History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# plugins
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-autosuggestions"
zplug 'hlissner/zsh-autopair'
zplug "zsh-users/zsh-completions"
zplug 'zsh-users/zsh-history-substring-search'
#zplug 'marlonrichert/zsh-autocomplete'
zplug "zsh-users/zsh-syntax-highlighting", defer:2 #must be the last one
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load


# Key
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

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
alias cls='clear'
# ------------------------------------------Alias------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# Ignore lower upper
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Command line alias to start the browser-sync server
alias serve="browser-sync start --server --files ."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
