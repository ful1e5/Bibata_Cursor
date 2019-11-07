#!/bin/bash

#Color print function 
show_Msg() {
    echo -e "\033[1;34m$@\033[0m"
}
show_command() {
    echo -e "\033[1;93m$@\033[0m"
}
show(){
    echo -e "\033[0;34m$@\033[0m"
}
error(){
    echo -e "\033[0;31m$@\033[0m"
}

echo -ne "Checking Requirements...\\r"

if  ! type "inkscape" > /dev/null ; then
    error "\\nFAIL: inkscape must be installed"
    exit 1
fi

if  ! type "xcursorgen" > /dev/null ; then
    error "\\nFAIL: xcursorgen must be installed"
    exit 1
fi

if ! command -v python3 &>/dev/null; then
    erroe "\\nFAIL: Python 3 must be installed"
fi
echo -e "Checking Requirements... DONE"




echo -ne "Generating Installer...\\r"
    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        cp src/in.inst Installer_Bibata.sh
    fi
echo -e "\033[0KGenerating Installer... DONE"

echo -ne "Making Installer Executable...\\r"
    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        gksu chmod +x Installer_Bibata.sh
    fi

show_Msg() {
    echo -e "\033[1;34m$@\033[0m"
}
show_command() {
    echo -e "\033[1;93m$@\033[0m"
}
show(){
    echo -e "\033[0;34m$@\033[0m"
}
error(){
    echo -e "\033[0;31m$@\033[0m"
}

echo -e "\033[0KMaking Installer Executable... DONE"

show_Msg "For Installation Use Following Command:\n\n"
show_command "\t sudo ./Installer_Bibata.sh\n"
exit

echo "COMPLETE!"
