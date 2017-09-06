# M2 Shell Tools
A small collection of shell scripts to make my life easier while using the Monkey2 Programming Language (http://monkeycoder.co.nz).

*WARNING! These scripts are potentially dangerous - specially the Ram Edit one! - and may cause you to loose work if you don't know what you're doing. I expect people to customize these scripts to their needs, not use them as they are!*

These scripts were created for OS X, but should work well in Linux with minor modifications. Make sure you set the M2 path correctly at the top of the scripts when necessary.

You can create symlinks for each script on /usr/local/bin and set each link to executable with "chmod a+x scriptname".

The tools are:
# makemod
Compiles any module in Desktop debug and release mode. If located at usr/local/bin, you can compile any module in the Modules folder, from anywhere.

# copymod
Useful to keep modules outside the Monkey2/Modules folder. Copies the entire module and compiles it right away.

# countlines
Counts the number of code lines in any folder and its subfolders, searching for a name pattern and a path pattern to exclude from the count. Can be used to count lines in any programming language source files.

# ramedit
Creates a 1GB RAMdrive, copies a project folder to it and launches your current Monkey2 editor (assuming there's a file named just like the folder inside it, like "myProject/myProject.monkey2". Syncs any changes back to the original every 5 minutes, or when you're done and hit "ctrl+c" to kill the script.

To prevent accidental changes in the original while the ram copies are being edited, original files are locked and are only unlocked when the script finishes. Benefits:

	- Lowers the load on SSD drives and cloud drives (like Dropbox or Google Drive) that monitor the project folder
	
	- Faster compiling? Dunno, maybe a bit.
	
	- Keeps original source files clean, since it avoids synchronizing ".build" and ".products" folders.
	
	- Kinda dangerous! If your computer crashes before changes are synchronized, they're lost forever, like, "poof"!

