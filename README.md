# Installation

## Clone and setup

please make sure you:

	git config core.filemode false
	git config core.autocrlf input

(you can also use `git config --global` to apply these globally)

### Windows

On windows, assume that the default home is c:\Users\gmcwilliams

	cd c:\Users\gmcwilliams
	git clone ssh://ssh.github.com/garymcwilliams/dotvim.git vimfiles
	copy vimfiles/_vimrc

### Linux

	cd ~
	git clone ssh://ssh.github.com/garymcwilliams/dotvim.git .vim
	ln -s .vimrc .vim/vimrc

## Fetch submodules

To get started on a new server, initialise git submodules

	cd vimfiles
	git submodule init
	git submodule update --remote --merge
	git commit

# Adding a new package
in the git cloned folder (using a shell, so git bash on windows)

	./add-package vim-airline.vim https://github.com/vim-airline/vim-airline.git
	git commit
NOTE: ensure git commit is only committing the addition of the pack, nothing else

# Keep packages up to date
in the git cloned folder (using a shell, so git bash on windows)

	git submodule update --remote --merge
	git commit

If the above does not cause any updates to occur, then update manually:
	git submodule foreach git pull origin master

