# makemod
A shell script that takes a folder outside Monkey2/modules, copies it to the appropriate path and compiles it.
This should facilitate the life for those whishing to develop modules for the Monkey 2 programming language (http://http://monkey2.monkey-x.com/) in folders outside the default monkey2/modules.

This script was created for OS X, but should work well in Linux with minor modifications. Make sure you set the M2 path correctly at the top of the script.

You can create symlinks for each script on /usr/local/bin and set each link to executable with "chmod a+x scriptname".
