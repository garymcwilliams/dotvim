This is a set of vim dot files
==============================

Installation
------------

## Windows & Cygwin 

(configured to use Windows vim rather than built-in vim)

	cd e:\Users\gmcwilliams\home
	git clone ssh://ssh.github.com/garymcwilliams/dotvim.git vimfiles
	copy vimfiles/_vimrc

## Linux

	cd ~
	git clone ssh://ssh.github.com/garymcwilliams/dotvim.git .vim
	ln -s .vimrc .vim/vimrc

## Then fetch submodules

	cd vimfiles
	git submodule init
	git submodule update

# Keep up to date

	cd vimfiles
	git submodule update

If the above does not cause any updates to occur, then update manually:
git submodule foreach git pull origin master

please make sure you:

	git config core.filemode false
	git config core.autocrlf input

(you can also use `git config --global` to apply these globally)

Using from work.
----------------

standard git protocol is blocked, so we need to use ssh

	git clone ssh://ssh.github.com/garymcwilliams/dotvim.git vimfiles

This comes with the associated `.ssh/config` entry

	Host ssh.github.com
	Port 443
	User git
	ForwardAgent yes
	ServerAliveInterval 10
	IdentityFile ~/.ssh/id_rsa.gmail
