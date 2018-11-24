#!/bin/bash

startTime=0
endTime=0
totalSeconds=7200
divider=300
i=0
b=$[$length+$i]

printf "%d %s %c\n" $startTime "abc" "def"
printf "%d %d\n" $endTime $length
echo $b

while(($startTime < $totalSeconds))
do
  i=$[$i+1]
  endTime=$[$startTime+$divider]
printf "i->%d startTime->%d" $i $startTime

ffmpeg -ss $startTime -to $endTime -accurate_seek -i xihongshi.mp4 -codec copy $i.mp4

  startTime=$[endTime]
echo " endTime-${endTime}"

done



