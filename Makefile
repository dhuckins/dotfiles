
.PHONY: dotfiles
dotfiles:  ## install/update dotfiles
	@rcup -vv -d "./dotfiles"