#!/bin/sh
get_command ()
{
COMMAND=$(whiptail --title "homemade_yes installer" --menu "What would you like to do?" 25 78 16 "Install homemade_yes" "Reconfigure your system to use homemade_yes." "Remove homemade_yes" "Uninstall homemade_yes and remove aliases." "Change aliases" "Add or remove aliases." "Quit" "Exit the installer." 3>&1 1>&2 2>&3)
}

while true 
do {
get_command
if [ "$COMMAND" = "Install homemade_yes" ]; then
mkdir ~/.homemade_yes
cd ~/.homemade_yes
curl -O -L https://github.com/PPPDUD/homemade_yes/releases/download/v0.2/homemade_yes
chmod +x homemade_yes
whiptail --msgbox "homemade_yes has been installed at ~/.homemade_yes.\n\nIn the following screen, type in any required aliases and press Ctrl+X to complete the setup process." 10 70 --title "Installer"
nano ~/.bash_aliases
whiptail --msgbox "Please restart any currently-open shells to apply your changes." 10 70 --title "Installer"
fi

if [ "$COMMAND" = "Remove homemade_yes" ]; then
cd ~/.homemade_yes
rm homemade_yes
cd ..
rmdir .homemade_yes
whiptail --msgbox "homemade_yes has been uninstalled from your system.\n\nIn the following screen, please remove any related aliases and press Ctrl+X to complete the removal process." 10 70 --title "Installer"
nano ~/.bash_aliases
whiptail --msgbox "Please restart any currently-open shells to apply your changes." 10 70 --title "Installer"
fi

if [ "$COMMAND" = "Change aliases" ]; then
nano ~/.bash_aliases
fi

if [ "$COMMAND" = "Quit" ]; then
exit 0
fi
}
done
