#!/bin/bash

#default value of git_path
git_path=/home/msys/Chef/Employee/SHELL_SCRIPTING

#if user has given the path
if [ "$2" ]; then
	git_path=$2;
fi

if [ -z "$1" ]; then
	echo "Nothing to do with command..."
	exit
fi

#switch cases for different commands
case "$1"
in
  init)
    init
    ;;

  clone)
    echo "enter url..."
    read url
    source ./clone.sh $url
    ;;

  status)
    source ./status.sh
    ;;

  add)
    source ./add.sh
    ;;

  commit)
    source ./commit.sh
    ;;

  remove)
    source ./remove.sh
    ;;

  diff)
    git diff
    ;;

  branch)
    source ./branch.sh
    ;;

  push)
    source ./push.sh
    ;;

  pull)
    source ./pull.sh
    ;;
esac