#!/bin/sh
get_command ()
{
COMMAND=$(whiptail --title "homemade_yes installer" --menu "What would you like to do?" 25 108 16 "Install homemade_yes (user-only)" "Install homemade_yes to ~/.homemade_yes." "Install homemade_yes (apt)" "Install homemade_yes as a system-wide Debian package." "Remove homemade_yes (apt)" "Remove the homemade_yes Debian package." "Remove homemade_yes (user-only)" "Uninstall a user-local homemade_yes." "Change aliases" "Add or remove aliases." "Quit" "Exit the installer." 3>&1 1>&2 2>&3)
}

while true 
do {
get_command
if [ "$COMMAND" = "Install homemade_yes (user-only)" ]; then
mkdir ~/.homemade_yes
cd ~/.homemade_yes
curl -O -L https://github.com/PPPDUD/homemade_yes/releases/download/v0.5/homemade_yes
chmod +x homemade_yes
whiptail --msgbox "homemade_yes has been installed at ~/.homemade_yes." 10 70 --title "Installer"
fi

if [ "$COMMAND" = "Remove homemade_yes (user-only)" ]; then
cd ~/.homemade_yes
rm homemade_yes
cd ..
rmdir .homemade_yes
whiptail --msgbox "homemade_yes has been uninstalled from your system.\n\nDon't forget to remove any relevant aliases!" 10 70 --title "Installer"
fi

if [ "$COMMAND" = "Install homemade_yes (apt)" ]; then
curl --output /tmp/homemade_yes.deb -L https://github.com/PPPDUD/homemade_yes/releases/download/v0.5/homemade_yes.deb
sudo apt install /tmp/homemade_yes.deb
rm /tmp/homemade_yes.deb
whiptail --msgbox "homemade_yes has been installed at /usr/bin/homemade_yes." 10 70 --title "Installer"
fi

if [ "$COMMAND" = "Remove homemade_yes (apt)" ]; then
sudo apt purge homemade-yes -y
whiptail --msgbox "homemade_yes has been uninstalled from your system.\n\nDon't forget to remove any relevant aliases!" 10 70 --title "Installer"
fi

if [ "$COMMAND" = "Change aliases" ]; then
nano ~/.bash_aliases
fi


if [ "$COMMAND" = "Quit" ]; then
exit 0
fi
}
done
