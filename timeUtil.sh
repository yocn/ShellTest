#!/bin/bash

time="01:00:10"
attr=(${time//:/ })
hour=${attr[0]}
min=${attr[1]}
sec=${attr[2]}

# echo ${{hour}}
second=`expr $hour \* 60 \* 60 + $min \* 60 + $sec`
echo $second
