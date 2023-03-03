#!/data/data/com.termux/files/usr/bin/bash

## TERMUX-MASTER uninstall script

## ANSI Colours (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
DEFAULT_FG="$(printf '\033[39m')"  DEFAULT_BG="$(printf '\033[49m')"

## Directories
PREFIX='/data/data/com.termux/files/usr'

## Banner
banner () {
    clear
    echo "
    ${BLUE}┌──────────────────────────────────────────────────┐
    ${BLUE}│${RED}░▀█▀░█▀▀░█▀▄░█▄█░█░█░█░█${ORANGE}░░░░░${GREEN}█▀▀░▀█▀░█░█░█░░░█▀▀░░${BLUE}│
    ${BLUE}│${RED}░░█░░█▀▀░█▀▄░█░█░█░█░▄▀▄${ORANGE}░▄▄▄${RED}░${GREEN}▀▀█░░█░░░█░░█░░░█▀▀░░${BLUE}│
    ${BLUE}│${RED}░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀${ORANGE}░░░░░${GREEN}▀▀▀░░▀░░░▀░░▀▀▀░▀▀▀░░${BLUE}│
    ${BLUE}└──────────────────────────────────────────────────┘
    ${BLUE}[${RED}*${BLUE}] ${ORANGE}By- EVILXPLOIT"
}

## Script Termination
exit_on_signal_SIGINT () {
    { printf "\n\n%s\n" "    ${BLUE}[${RED}*${BLUE}] ${RED}Script interrupted." 2>&1; echo; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM () {
    { printf "\n\n%s\n" "    ${BLUE}[${RED}*${BLUE}] ${RED}Script terminated." 2>&1; echo; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colours
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Check for previous installation
uninstall_style () {
	banner
	if [[ (-L $PREFIX/bin/TERMUX-MASTER) && (-d $PREFIX/share/TERMUX-MASTER) ]]; then
		{ echo; echo "    ${BLUE}[${RED}*${BLUE}] ${ORANGE}Uninstalling TERMUX-MASTER..."; echo; }
		{ echo "    ${BLUE}[${RED}*${BLUE}] ${RED}Removing files from $PREFIX/share dir."${BLUE}; }
		{ rm -r $PREFIX/share/TERMUX-MASTER $PREFIX/bin/TERMUX-MASTER; }
		# Verify files
		if [[ (! -L $PREFIX/bin/TERMUX-MASTER) && (! -d $PREFIX/share/TERMUX-MASTER) ]]; then
			{ echo; echo "    ${BLUE}[${RED}*${BLUE}] ${GREEN}Uninstalled Successfully."; echo; }
			{ reset_color; exit 0; }
		else
			{ echo "    ${BLUE}[${RED}!${BLUE}] ${RED}Error Occured."; echo; reset_color; exit 1; }
		fi
	else
		{ echo; echo "    ${BLUE}[${RED}!${BLUE}] ${MAGENTA}TERMUX-MASTER ${GREEN}is not installed."; echo; }
		{ reset_color; exit 0; }
	fi
}

uninstall_style