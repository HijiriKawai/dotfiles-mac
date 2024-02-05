SHELL=/bin/zsh
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore .travis.yml .vscode .pre-commit-config.yaml .cz.json .commitlintrc.json
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

install: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo '==> brew install tools'
	@echo ''
	@brew bundle --global
	@echo '==> install AstroNvim and AstroNvim-conf'
	@git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	@git clone https://github.com/HijiriKawai/AstroNvim-conf.git ~/.config/nvim/lua/user
	@echo '==> install languages'
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	@source "$(HOME)/.cargo/env"
	@rustup self update
	@rustup update
	@chmod -R +x ~/bin
	@~/bin/mise-setup-language.sh
	
brewfile:
	@echo 'make or update .Brewfile'
	@brew bundle dump --global --force

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
