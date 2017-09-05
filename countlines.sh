#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere. 
# Use: countlines path pattern excludepattern

# Example: "countlines mySourceCode *.monkey2 example"
#this will find all files in the "mySourceCode" folder that match *.monkey2, but exclude files with "example" in name

if [ $3 ]; then
	find -L $1 -type f -name $2 ! -path "*$3*" | xargs wc -l
else
	find -L $1 -type f -name $2 | xargs wc -l
fi
