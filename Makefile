XDG_CONFIG_HOME := $(HOME)/.config

install:
	ln -sfn `pwd`/gitconfig $(HOME)/.gitconfig
	ln -sfn `pwd`/nvim $(XDG_CONFIG_HOME)/nvim
	ln -sfn `pwd`/nvim $(HOME)/.vim
