#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere.
# Make sure your Monkey 2 folder is set correctly here. Don't add "/" at the end!
M2PATH="/Applications/Blitz/Monkey2"

# Run Monkey's Makedocs
cd $M2PATH/scripts
bash ./makedocs.sh
echo ""
# Play beep
printf \\a
