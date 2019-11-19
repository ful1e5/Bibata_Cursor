#!/bin/sh

# Default settings
BIBATA=${BIBATA:-/tmp/Bibata}
REPO=${REPO:-KaizIqbal/Bibata_Cursor}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup_bibata_repo() {

	echo "${BLUE}Cloning Bibata Cursor...${RESET}"

	command_exists git || {
		error "git is not installed"
		exit 1
	}

	git clone -c core.eol=lf -c core.autocrlf=false \
		-c fsck.zeroPaddedFilemode=ignore \
		-c fetch.fsck.zeroPaddedFilemode=ignore \
		-c receive.fsck.zeroPaddedFilemode=ignore \
		--depth=1 --branch "$BRANCH" "$REMOTE" "$BIBATA" || {
		error "git clone of bibata_cursor repo failed"
		exit 1
	}

	echo
}

setup_bibata() {
    cd /tmp/Bibata/
	./install.sh
    rm -rf /tmp/Bibata
	echo
}

main() {

	printf "$GREEN"
	cat <<-'EOF'

    ██████╗ ██╗██████╗  █████╗ ████████╗ █████╗ 
    ██╔══██╗██║██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗ 
    ██████╔╝██║██████╔╝███████║   ██║   ███████║  
    ██╔══██╗██║██╔══██╗██╔══██║   ██║   ██╔══██║  
    ██████╔╝██║██████╔╝██║  ██║   ██║   ██║  ██║  
    ╚═════╝ ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ 

	EOF

	setup_color
	setup_bibata_repo
	setup_bibata

    rm -rf /tmp/Bibata
	printf "$RESET"
}

main "$@"
