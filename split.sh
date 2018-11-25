#!/bin/bash
spiltRoot="split"
mkdir $spiltRoot

mp4Dir=$1
echo $mp4Dir

mp4File=$(cd $mp4Dir; ls | grep .mp4)
mp4=(${mp4File// / })
# echo ${mp4[0]}
for (( i = 0; i < ${#mp4[@]}; i++ )); do
  i=0
  fileName=${mp4[i]}
  dirName="$spiltRoot/${fileName%%.*}/"
  echo $dirName
  mkdir $dirName
  echo $fileName
  source getVideoLength.sh
  # getVideoLength
  startTime=0
  endTime=0
  divider=300

  printf "%d %s %c\n" $startTime "abc" "def"
  printf "%d %d\n" $endTime $length

  while(($startTime < $durationSecond))
  do
    i=$[$i+1]
    endTime=$[$startTime+$divider]
  printf "i->%d startTime->%d" $i $startTime

  ffmpeg -ss $startTime -to $endTime -accurate_seek -i $fileName -codec copy $dirName$i.mp4

    startTime=$[endTime]
  echo " endTime-${endTime}"

  done

done
