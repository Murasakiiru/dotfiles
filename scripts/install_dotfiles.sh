#!/bin/bash
###
## Script d'installation du epot dotifles
###

check_program(){
	case "$1" in
		vim )
			echo "Test de $1"
			command -v $1 >/dev/null 2>&1 || install_program $1
			command -v $1 >/dev/null 2>&1 && echo "$1 installed"
			;;
		zsh )
			echo "Test de $1"
			command -v $1 >/dev/null 2>&1 || install_program $1
			command -v $1 >/dev/null 2>&1 && echo "$1 installed"
			;;
	esac
}

install_program(){
	echo "Installation en cours de : $1 ..."
	su root -c "pacman -S --noconfirm $1"
	echo "$1 installé"
}


check_program vim
check_program zsh
