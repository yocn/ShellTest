#!/bin/bash

source getVideoLength.sh

echo $durationSecond

startTime=0
endTime=0
divider=300
i=0
b=$[$length+$i]

printf "%d %s %c\n" $startTime "abc" "def"
printf "%d %d\n" $endTime $length
echo $b

while(($startTime < $durationSecond))
do
  i=$[$i+1]
  endTime=$[$startTime+$divider]
printf "i->%d startTime->%d" $i $startTime

ffmpeg -ss $startTime -to $endTime -accurate_seek -i $fileName -codec copy $i.mp4

  startTime=$[endTime]
echo " endTime-${endTime}"

done
