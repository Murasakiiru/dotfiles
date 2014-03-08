#!/bin/bash
set -x
###
## Install script for dotifles repos
## Now just for Arch ...
## Need to be in the dotfile folder
## Zsh + vim + scm_breeze
###
check_program(){
	case "$1" in
		vim )
			echo "Testing $1 ..."
			command -v $1 >/dev/null 2>&1 || install_program $1
			command -v $1 >/dev/null 2>&1 && echo "$1 installed"
			;;
		zsh )
			echo "Testing $1 ..."
			command -v $1 >/dev/null 2>&1 || install_program $1
			command -v $1 >/dev/null 2>&1 && echo "$1 installed"
			;;
	esac
}

install_program(){
	echo "Installing $1 ..."
	su root -c "pacman -S --noconfirm $1"
	echo "$1 installed"
}

install_conf(){
	DIR=$(pwd | cut -d '/' -f 4)
	if[ $DIR = "dotfiles" ]
		then
			echo "Configuring vim ..."
			#ln -s zsh/zshrc /home/$USER/.zshrc
			for i in `ls -l zsh | grep -v zsh | awk '{print $9}'
				do echo $i
			done
			echo "Configuring zsh ..."
		else
			echo "Rerun the script from the dotfiles folder !"
	fi
}

#check_program vim
#check_program zsh

install_conf

