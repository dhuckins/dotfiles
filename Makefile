
ROLES_DIR := roles

.PHONY: dotfiles
dotfiles:  ## install/update dotfiles
	@rcup -vv -d "./dotfiles"

$(ROLES_DIR):
	@ansible-galaxy install -r requirements.yml

ansible: | $(ROLES_DIR)
	@ansible-playbook main.yml --ask-become-pass
