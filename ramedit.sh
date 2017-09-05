#!/bin/sh

# OSX: Copy this script (or create a symlink) in /usr/local/bin so you can run it from anywhere. 
RAMPATH="/Volumes/RamDisk"

# Basic input checks
if [ $# -eq 0 ]; then
	echo "Error: No arguments"
	exit 1
fi
if ! [ -d "$1" ]; then
	echo "Error: Folder $1 does not exist"
	exit 1
fi

# Copy function
ramsync()
{
	rsync -av --exclude=*.build* --exclude=*.products --exclude=.* $1/ $2/
}

#Creates ramdisk if there isn't already one named "RamDisk"
if ! [ -d "/Volumes/RamDisk" ]; then
	echo "********************************** Creating ramdisk **********************************"
	diskutil erasevolume HFS+ "RamDisk" `/usr/bin/hdiutil attach -nobrowse -nomount ram://2097152`
	exit 1
fi

# Copy the project, locks original files
echo "********************************** Copying folder $1 **********************************"
ramsync $1 $RAMPATH/$1
chflags -R uchg $1

# Assumes the file name is the same as the folder name, opens file.
open $RAMPATH/$1/$1.monkey2

# Traps ctrl+c
control_c()
{
	echo ""
	#when this subroutine is called by "trap", $2 is the original folder.
	chflags -R nouchg $2
	ramsync $1 $2
	echo "********************************** Done! **********************************"
	exit $?
}
trap 'control_c $RAMPATH/$1 $1' SIGINT

# Copies changes every minute until ctrl+c
while true
do 
	chflags -R nouchg $1
	ramsync $RAMPATH/$1 $1
	chflags -R uchg $1
	sleep 60
done



