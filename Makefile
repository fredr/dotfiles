XDG_CONFIG_HOME := $(HOME)/.config

install:
	ln -sfn `pwd`/bashrc $(HOME)/.bashrc
	ln -sfn `pwd`/bash_prompt $(HOME)/.bash_prompt
	ln -sfn `pwd`/bash_completion $(HOME)/.bash_completion
	ln -sfn `pwd`/bash_aliases $(HOME)/.bash_aliases
	ln -sfn `pwd`/gitconfig $(HOME)/.gitconfig
	ln -sfn `pwd`/nvim $(XDG_CONFIG_HOME)/nvim
	ln -sfn `pwd`/spacemacs $(HOME)/.spacemacs
	ln -sfn `pwd`/fontconfig $(XDG_CONFIG_HOME)/fontconfig
	sudo ln -sfn `pwd`/sysctl_local.conf /etc/sysctl.d/local.conf
