# yes_installer
An experimental installer script for `homemade_yes`. `yes_installer` is still in early development; use at your own risk!

Intended for Ubuntu 25.04, and should work on all modern Ubuntu versions (including Ubuntu >= 25.10).

You can install the dependencies for this script by running `sudo apt install pv curl`.

## Installing homemade_yes
First, select the _Install homemade_yes_ option and press _Enter_.

After a moment, this screen should come up:
<img width="1107" height="400" alt="image" src="https://github.com/user-attachments/assets/b337359e-6157-4759-b06c-727be93872a2" />

Continue the process. `nano` will open and let you define an alias (or multiple!) to enhance your quality-of-life when invoking `homemade_yes`. 

If you want `homemade_yes` to replace your system's yes implementation where possible, type `alias yes=~/.homemade_yes/homemade_yes`. Once you're done, use _Ctrl+X_ to save your new configuration and return to the installation menu.

Your changes will be applied upon reopening the terminal.

## Uninstalling homemade_yes
First, select the _Remove homemade_yes_ option and press _Enter_.

`yes_installer` will delete your `homemade_yes` installation and display the following message:
<img width="1086" height="394" alt="image" src="https://github.com/user-attachments/assets/20a4a899-8cda-4361-80e8-10d81796b09a" />

Continue and `nano` will open up. Remove any lines relating to your previous `homemade_yes` installation and press _Ctrl+X_ to save your changes.

Restart your shell and run `yes --version`. If the output doesn't mention Mojavesoft, then you have successfully reverted to your system's `yes` implementation.

