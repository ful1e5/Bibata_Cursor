#! /bin/bash

show_question() {
  echo -e "\033[1;34m$@\033[0m"
}

show_dir() {
  echo -e "\033[1;32m$@\033[0m"
}

show_error() {
  echo -e "\033[1;31m$@\033[0m"
}

end() {
  echo -e "\nExiting...\n"
  exit 0
}

continue() {
  show_question "\nDo you want to continue? (Y)es, (N)o : \n"
  read INPUT
  case $INPUT in
   ( [Yy]* ) ;;
   ( [Nn]* ) end;;
   ( * ) show_error "\nSorry, try again."; continue;;
  esac
}

replace() {
  show_question "\nFound an existing installation. Replace it? (Y)es, (N)o :\n" 
  read INPUT
  case $INPUT in
    ( [Yy]* ) rm -rf "$@/Bibata*" 2>/dev/null;;
    ( [Nn]* ) ;;
    ( * ) show_error "\tSorry, try again."; replace $@;;
  esac
}

install() {

  # PREVIEW

  # Show destination directory
  echo -e "\nBibata Cursor Theme will be installed in:\n"
  show_dir "\t$DEST_DIR"
  if [ "$UID" -eq "$ROOT_UID" ]; then
    echo -e "\nIt will be available to all users."
  else
    echo -e "\nTo make them available to all users, run this script as root."
  fi

  continue

  # INSTALL

  # Check destination directory
  if [ ! -d $DEST_DIR ]; then
    mkdir -p $DEST_DIR
  elif [[ -d $DEST_DIR/Bibata ]]; then
    replace $DEST_DIR
  fi

  echo -e "\nInstalling Bibata..."
  
  # Copying files
  cp -rf $Bibata_Classic $DEST_DIR
  cp -rf $Bibata_Oil $DEST_DIR
  cp -rf $Bibata_Ice $DEST_DIR
  cp -rf $Bibata_Amber $DEST_DIR
  chmod -R 755 $DEST_DIR/Bibata_*



  echo "Installation complete!"
  echo "Do not forget you have to set Bibata Cursor."
}

remove() {

  # PREVIEW

  # Show installation directory
  if [[  -d $DEST_DIR/Bibata_Classic || -d $DEST_DIR/Bibata_Oil || -d $DEST_DIR/Bibata_Ice || -d $DEST_DIR/Bibata_Amber ]]; then
    echo -e "\nBibata Cursor Theme installed in:\n"
    show_dir "\t$DEST_DIR"
    if [ "$UID" -eq "$ROOT_UID" ]; then
      echo -e "\nIt will remove for all users."
    else
      echo -e "\nIt will remove only for current user."
    fi

    continue
  
  else
    show_error "\nBibata Cursor is not installed in:\n"
    show_dir "\t$DEST_DIR\n"
    end
  fi

  # REMOVE

  echo -e "\nRemoving Bibata..."

  # Removing files
  rm -rf $DEST_DIR/Bibata_Classic
  rm -rf $DEST_DIR/Bibata_Oil
  rm -rf $DEST_DIR/Bibata_Ice
  rm -rf $DEST_DIR/Bibata_Amber

  echo "Removing complete!"
  echo "I hope to see you soon."
}

main() {
  show_question "What you want to do: (I)nstall, (R)emove : \n"
  read INPUT
  case $INPUT in
    ( [Ii]* ) install;;
    ( [Rr]* ) remove;;
    ( * ) show_error "\nSorry, try again."; main;;
  esac
}

ROOT_UID=0
DEST_DIR=
Bibata_Classic=./Bibata_Classic/out/X11/Bibata_Classic 
Bibata_Oil=./Bibata_Oil/out/X11/Bibata_Oil
Bibata_Ice=./Bibata_Ice/out/X11/Bibata_Ice
Bibata_Amber=./Bibata_Amber/out/X11/Bibata_Amber
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.icons"
fi

echo -e "\e[1m\n+---------------------------------------------+"
echo -e "|        Bibata Cursor Installer Script       |"
echo -e "+---------------------------------------------+\n\e[0m"

main
