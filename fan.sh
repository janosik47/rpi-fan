#!/bin/bash

max_on=80
max_off=70

prefix="RPI Fan Service:"

t1=$(cat /sys/class/thermal/thermal_zone0/temp)
t2=$((t1/1000))

f1=$(cat /sys/class/thermal/cooling_device0/cur_state)
if [ $f1 -gt 0 ]
then
  f2="ON"
else
  f2="OFF"
fi

# fan ON and temp below the threshold - turn OFF
if [[ $f1 -gt 0 && $t2 -lt $max_off ]]
then
  /usr/bin/logger -i "$prefix Current temp it $t2[C] < $max_off[C], turning fan OFF"
  echo 0 >  /sys/class/thermal/cooling_device0/cur_state

# fan OFF and temp above the threshold - turn ON
elif [[ $f1 -lt 1 && $t2 -ge $max_on ]]
then 
  /usr/bin/logger -i "$prefix Current temp it $t2[C] > $max_on[C], turning fan ON"
  echo 1 >  /sys/class/thermal/cooling_device0/cur_state

# keep the fan as it is  
else 
  /usr/bin/logger -i "$prefix Current temp is $t2 [C] (thresholds: OFF<$max_off[C] & ON>=$max_on[C]) and the fan is $f2"
fi
