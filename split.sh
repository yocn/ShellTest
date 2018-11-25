#!/bin/bash
realPath=$(dirname $0)
cd ./${realPath}  # 当前位置跳到脚本位置
realPath=$(pwd)   # 取到脚本目录
echo $realPath

spiltRoot="split"
rm -rf $realPath/$spiltRoot
mkdir $spiltRoot

mp4Dir=$1
echo $mp4Dir

mp4File=$(cd $mp4Dir; ls | grep .mp4)
mp4=(${mp4File// / })
# echo ${mp4[0]}
for (( i = 0; i < ${#mp4[@]}; i++ )); do
  fileName=${mp4[i]}
  dirName="$spiltRoot/${fileName%%.*}/"
  echo "dirName->$dirName"
  mkdir $dirName
  echo "fileName->$fileName"
  source getVideoLength.sh
  # getVideoLength
  startTime=0
  endTime=0
  divider=300
  index=0

  while(($startTime < $durationSecond))
  do
    index=$[$index+1]
    endTime=$[$startTime+$divider]
  printf "index->%d startTime->%d endTime->%d durationSecond->%d \n" $index $startTime $endTime $durationSecond

  ffmpeg -ss $startTime -to $endTime -accurate_seek -i $realPath/$mp4Dir/$fileName -codec copy $dirName$index.mp4

    startTime=$[endTime]
  echo " endTime-${endTime}"

  done

done
