#!/bin/bash
echo "a->"
startTime=0endTime=0length=3697i=0

echo "b->"
while ($endTime -le $length)
 do    #statements    i=$[$i+1]    endTime=$[$startTime+280]    ffmpeg -i xihongshi.mp4  -ss $startTime -to $endTime -acodec copy -vcodec copy $i.mp4    startTime=$[endTime]done