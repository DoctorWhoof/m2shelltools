#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere. 
# Make sure your Monkey 2 folder is set correctly here. Don't add "/" at the end!
M2PATH="/home/leosantos/dev/monkey2"

# Run Monkey's Makemods
echo "Making module using mx2cc..."
echo ""
$M2PATH/bin/./mx2cc_macos makeapp -config=release -target=desktop $1
# $M2PATH/bin/./mx2cc_macos makemods -config=debug -target=emscripten $1
# $M2PATH/bin/./mx2cc_macos makemods -config=release -target=emscripten $1

echo ""
echo "************************* Done! *************************"
echo ""
# Play beep
printf \\a
