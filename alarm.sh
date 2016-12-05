#!/bin/bash


# ------------------------------------ #
# Taking care of input from cli
args=`getopt -o t:m: -- "$@"`
if test $? != 0
     then
         echo 'Usage: -t time -m message'
         exit 1
fi
eval set -- "$args"
for i
do
  case "$i" in
        -t) shift;time=$1;shift;;
        -m) shift;message=$1;;
  esac
done

echo "You have chosen to set arlam for the next $time"
echo "You will see '$message' when time is up"

# ------------------------------------ # 
# Method to call
function sleepMethod {
	sleep $time && echo $message
}


# ------------------------------------ #
# Main
sleepMethod &
exit 0