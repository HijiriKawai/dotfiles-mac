# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH=/usr/local/bin/git:$PATH

# setting
export XDG_CONFIG_HOME="$HOME/.config"
export LANG=ja_JP.UTF-8
setopt AUTO_PARAM_KEYS
setopt AUTO_CD
autoload -Uz colors
colors


# path
export PATH=$PATH:/Users/hijiri/bin/
export PATH="/Users/hijiri/.deno/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="/Users/hijiri/go/bin:$PATH"
export PATH="/Users/hijiri/.local/bin:$PATH"
export PATH="$PATH:/Users/hijiri/.ghcup/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
eval "$(/opt/homebrew/bin/mise activate zsh)"
export MISE_DATA_DIR=$HOME/.mise
export MISE_CACHE_DIR=$MISE_DATA_DIR/cache
export PATH="$HOME/.local/share/mise/shims:$PATH"
fpath+=~/.zfunc
eval "$(sheldon source)"
export PATH=/usr/X11/bin:$PATH

# alias
alias e='exa --icons --git'
alias l=e
alias ls=e
alias ea='exa -a --icons --git'
alias la=ea
alias ee='exa -aahl --icons --git'
alias ll=ee
alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
alias lt=etalias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
alias lta=eta
alias grep=rg
alias cat=bat
alias l='clear && ls'
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'
alias v='nvim'
alias vi='nvim'
alias vz='nvim ~/.zshrc'
# alias vim='nvim'
alias python=python3
alias walk='walk --icons' 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.poetry/bin:$PATH"

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


# walk setting
function lk {
  cd "$(walk "$@")"
}

export WALK_EDITOR=code
