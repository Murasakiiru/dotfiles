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
		azsh )
			echo "Test de $1"
			command -v $1 >/dev/null 2>&1 || install_program $1
			command -v $1 >/dev/null 2>&1 && echo "$1 installed"
			;;
	esac
}

install_program(){
	echo $1

}


check_program vim
check_program azsh
