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

# ------------------------------------ # 
# Parsing of time
if [[ "$TIME" =~ ^(.)([sS])$ ]]; then
		TIME_PARSED="${BASH_REMATCH[1]} second(s)"
elif [[ "$TIME" =~ ^(.)([mM])$ ]]; then
		TIME_PARSED="${BASH_REMATCH[1]} minute(s)"
elif [[ "$TIME" =~ ^(.)([hH])$ ]]; then
		TIME_PARSED="${BASH_REMATCH[1]} hour(s)"
elif [[ "$TIME" =~ ^(.)([dD])$ ]]; then
		TIME_PARSED="${BASH_REMATCH[1]} day(s)"
else
		TIME_PARSED="$TIME"
fi

echo "You have chosen to set arlam for the next ${TIME_PARSED}"
echo "You will see '${MESSAGE}' when time is up"

# ------------------------------------ # 
# Method to call
function sleepMethod {
	# Sleep for the amount of specified time, then display message and make a sound
	sleep ${TIME} && echo ${MESSAGE} && echo $'\a'
}


# ------------------------------------ #
# Main
sleepMethod &
exit 0