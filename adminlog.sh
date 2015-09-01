#!/bin/zsh
ver="0.0.2" # from 2012-10-19

# Copyright (c) 2012, Kondou
# This work is licensed under the MIT License

# This is a _really_ simple helper script for server logs.
# Basically it's just textparsing and directory-/filemanagement.
# Also it's in a really early stage (as the Version might say).

# Parse the input, quite simple ...
case $1 in
  -s)
	msg="[`date "+%-H:%-M %-d.%-m.%y"`] [Software] $2"
  ;;
  -U)
	msg="[`date "+%-H:%-M %-d.%-m.%y"`] [Software] Update: $2"
  ;;
  -o)
	msg="[`date "+%-H:%-M %-d.%-m.%y"`] [Other   ] $2"
  ;;
  -u)
	msg="[`date "+%-H:%-M %-d.%-m.%y"`] [User    ] $2"
  ;;
  -b)
	msg="[`date "+%-H:%-M %-d.%-m.%y"`] [Backup  ] $2"
  ;;
  -c)
	msg="[`date "+%-H:%-M %-d.%-m.%y"`] [$2] $3"
  ;;
  -h)
	echo "Kondou's sysadmin log tool version $ver"
	echo "Appends activity to this months log"
	echo "Example: ./adminlog.sh -s \"foo bar\" (quotes are important)"
	echo "--> [17:41 21.09.12] [Software] foo bar"
	echo "-s : [Software] …"
	echo "-D : [Software] Update: …"
	echo "-o : [Other   ] …"
	echo "-u : [User    ] …"
	echo "-b : [Backup  ] …"
	echo "-c : Custom text between square braces"
	echo "     Does _not_ indent itself (text between braces is 8 signs)"
	echo "     Example: ./adminlog.sh -c foo \"bar wombat\" -> [Date] [foo] bar wombat"
	exit
  ;;
  *)
	echo "Unknown parameter, see help (-h)"
	exit
  ;;
esac

if [ ! -d "log/`date "+%Y"`" ]; then
	mkdir -p log/`date "+%Y"` # If the year-, or even the log-, directory doesn't exist: create it
fi

touch log/`date "+%Y"`/`date "+%-m"`.txt # Creating the logfile if it doesnt exist, without if
echo $msg >> log/`date "+%Y"`/`date "+%-m"`.txt
