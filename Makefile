XDG_CONFIG_HOME := $(HOME)/.config

install:
	ln -sfn `pwd`/gitconfig $(HOME)/.gitconfig
	ln -sfn `pwd`/bash_prompt $(HOME)/.bash_prompt
	ln -sfn `pwd`/bash_alias $(HOME)/.bash_alias
	ln -sfn `pwd`/nvim $(XDG_CONFIG_HOME)/nvim
