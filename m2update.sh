#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere.
# Make sure your Monkey 2 folder is set correctly here. Don't add "/" at the end!
M2PATH="/Applications/Leo/Blitz/Monkey2"

# Run Monkey's Makemods
echo "Updating Monkey 2..."
echo ""
cd $M2PATH/scripts
./rebuildmx2cc.sh
./rebuildmods.sh
./makedocs.sh
echo ""
echo "************************* Done! *************************"
echo ""
# Play beep
printf \\a
