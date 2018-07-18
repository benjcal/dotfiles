#Benj Dotfiles Makefile

SHELL := /bin/bash
MAKEFLAGS += --silent

CONFIG_DIR := ~/.config
TMP := /tmp

DEIN_DIR := $(CONFIG_DIR)/dein
DEIN_INSTALL_URL := "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"


all : 	check_bins \
	install_dein \
	install_nvim_config \
	install_antigen \
	install_zsh_config \
	install_tmux_config

# Check if the needed programs are installed
check_bins :
	@type nvim zsh tmux

# Install dein.vim Vim package manager
install_dein : 
	if test -d $(DEIN_DIR); \
	then echo "dein.vim is installed"; \
	else curl $(DEIN_INSTALL_URL) > $(TMP)/dein_inst.sh; \
	sh $(TMP)/dein_inst.sh $(DEIN_DIR); \
	fi

# nvim config
install_nvim_config : $(CONFIG_DIR)/nvim
	cp -ir nvim $(CONFIG_DIR)

# Antigen ZSH package manager
install_antigen :
	if test -f ~/.antigen.zsh; \
		then echo "antigen is installed"; \
		else curl -L git.io/antigen > ~/.antigen.zsh; \
	fi

# ZSH config
install_zsh_config : 
	cp -i zsh/zshrc ~/.zshrc
	cp -i zsh/zshenv ~/.zshenv

# tmux config
install_tmux_config :
	cp -i tmux/tmux.conf ~/.tmux.conf

# check dotfiles config
update_dotfiles : $(CONFIG_DIR)/nvim ~/.zshrc ~/.tmux.conf
	cp -r $(CONFIG_DIR)/nvim/init.vim nvim/init.vim
	cp ~/.zshrc zsh/zshrc
	cp ~/.tmux.conf tmux/tmux.conf
	git add .
	git commit -m "Dotfiles updated"
