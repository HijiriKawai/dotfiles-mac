# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
. /opt/homebrew/opt/asdf/libexec/asdf.sh
fpath+=~/.zfunc

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.poetry/bin:$PATH"

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# powerlevel10k
#zinit ice depth"1" # git clone depth
#zinit light romkatv/powerlevel10k

# starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
