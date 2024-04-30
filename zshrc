export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto  

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
	git
	z
	fzf
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=/home/braint/.local/bin:$PATH
export PKG_CONFIG_PATH=/opt/build/lib/pkgconfig
export OPENSSL_CONF=/usr/lib/ssl/openssl.cnf
# export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar"

alias pacman="sudo pacman"
alias java8="sdk u java 8.0.372.fx-zulu"
alias java11="sdk u java 11.0.20-tem"
alias java17="sdk u java 17.0.8-tem"
alias nvimrc="nvim ~/.config/nvim"

alias docker_start="sudo systemctl start docker"
alias dc="~/Documents/docker-compose/launcher.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
