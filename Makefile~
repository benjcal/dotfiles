#Benj Dotfiles Makefile

SHELL := /bin/bash
CONFIG_DIR := ~/.config
DEIN_DIR := $(CONFIG_DIR)/dein
DEIN_INSTALL_URL := "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"
TMP := /tmp
MAKEFLAGS += --silent

all : check_bins make_dirs install_dein install_vim_config install_antigen install_zsh_config

check_bins :
	@type nvim zsh

install_dein : 
	if test -d $(DEIN_DIR); \
		then echo "dein.vim is installed"; \
		else curl $(DEIN_INSTALL_URL) > $(TMP)/dein_inst.sh; \
			 sh $(TMP)/dein_inst.sh $(DEIN_DIR); \
	fi

install_vim_config : $(CONFIG_DIR)/nvim
	cp -r nvim $(CONFIG_DIR)

make_dirs : 
	mkdir -p $(CONFIG_DIR)

update_dotfiles : $(CONFIG_DIR)/nvim
	cp -r $(CONFIG_DIR)/nvim/init.vim nvim/init.vim
	cp ~/.zshrc zsh/zshrc
	git add .
	git commit -m "Dotfiles updated"

install_antigen :
	if test -f ~/.antigen.zsh; \
		then echo "antigen is installed"; \
		else curl -L git.io/antigen > ~/.antigen.zsh; \
	fi

install_zsh_config : 
	cp zsh/zshrc ~/.zshrc
