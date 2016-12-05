#!/bin/bash
# Author: Anh Vu Nguyen
# Simple alarm in bash script

# ------------------------------------ #
# String for helppage that users might need
help="$(basename "$0") [-h] [-t -m] -- program to remind you with a customized message

where:
	-t set the countdown clock
	-m set the customized message when the alarm sounds"

# ------------------------------------ #
# Taking care of input from cli
while [[ $# -gt 0 ]]
do
key="$1"

HELP=false

case $key in
	-t|--time)
	TIME="$2"
	shift
	;;
	-m|--message)
	MESSAGE="$2"
	shift
	;;
	-h|--help)
	HELP=true
	;;
	*)

	;;
esac
shift
done

if ${HELP}
	then
		echo $help
		exit 1;
fi

echo "You have chosen to set arlam for the next ${TIME}"
echo "You will see '${MESSAGE}' when time is up"

# ------------------------------------ # 
# Method to call
function sleepMethod {
	sleep ${TIME} && echo ${MESSAGE}
}


# ------------------------------------ #
# Main
sleepMethod &
exit 0