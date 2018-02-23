#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere.
# Make sure your Monkey 2 folder is set correctly here. Don't add "/" at the end!
TEDPATH="/Applications/Blitz/Ted2Go"

echo "Updating Ted2Go..."
echo ""
cd $TEDPATH
makeapp Ted2.monkey2

echo ""
echo "************************* Done! *************************"
echo ""
# Play beep
printf \\a
say ted2 rebuild done
