#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere. 
# Make sure your Monkey 2 folder is set correctly here. Don't add "/" at the end!
M2PATH="/Applications/Blitz/Monkey2"

# Start up by checking for at least one argument and valid source folder
echo ""
echo "************************* makemod for Monkey2 *************************"
echo ""
if [ $# -eq 0 ]; then
	echo "Error: No arguments"
	exit 1
fi
if ! [ -d "$1" ]; then
	echo "Error: Folder $1 does not exist"
	exit 1
fi

# Back-up original module, only if backup doesn't exist already
if ! [ -d "$M2PATH/modules.backup/$1" ]; then
	echo "Backing up original module."
	mkdir $M2PATH/modules.backup
	# mkdir $M2PATH/modules.backup/$1
	cp -R $1 $M2PATH/modules.backup/
else
	echo "Module backup already exists, skipping."
fi

# Remove existing folder from modules folder
if [ -d "$M2PATH/modules/$1" ]; then
	echo "Removing existing module $1"
	rm -rf $M2PATH/modules/$1
fi

# Copy the module
echo "Copying module $1"
cp -r $1 $M2PATH/modules/

# Clean up build folders
echo "Cleaning up build folders"
rm -rf $M2PATH/modules/$1/*.build*
rm -rf $M2PATH/modules/$1/*/*.build*

# Run Monkey's Makemods
echo "Making module using mx2cc..."
echo ""
$M2PATH/bin/./mx2cc_macos makemods -config=debug -target=desktop $1
$M2PATH/bin/./mx2cc_macos makemods -config=release -target=desktop $1
# $M2PATH/bin/./mx2cc_macos makemods -config=debug -target=emscripten $1
# $M2PATH/bin/./mx2cc_macos makemods -config=release -target=emscripten $1

echo ""
echo "************************* Done! *************************"
echo ""
# Play beep
printf \\a
