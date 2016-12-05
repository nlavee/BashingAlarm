# BashingAlarm

[What]  
This is just a simple bash script that sleeps based on user input for time, and display a customized message when the program wakes up.

[How]  
The terminal program is as follow:
```
> ./alarm.sh -t TIME -m MESSAGE
```
where TIME is how much you want the alarm to sleep for. e.g. 1s = 1 second. 1m = 1 minutes. 1d = 1 day. MESSAGE on the other hand is the customized message that you want to see. e.g. "Hello there".  
```
> ./alarm.sh -t 5s -m "Hello There"
You have chosen to set arlam for the next 5s
You will see 'Hello There' when time is up

> Hello There
```
I would suggest aliasing the script so that it can be run as a global util. To do this, simply edit `~/.bashrc` file to include the alias.  
For example,  
```
# Users specific aliases and functions
alias alarm="PATH_TO_FOLDER/alarm.sh"
```

[Why]  
I was bored and thought that some bash scripting would be nice to do in less than an hour.

[Contact]  
[anhvu.nguyenlam@gmail.com](mailto:anhvu.nguyenlam@gmail.com)  
[vu.nguyen@skidmore.edu](mailto:vu.nguyen@skidmore.edu)
