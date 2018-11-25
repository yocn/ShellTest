#!/bin/bash
# rootPath=$(cd 'dirname $0'; pwd)
# rootPath=$(cd video; pwd)
# echo $rootPath

# rootPath=$(cd ../..; pwd)
# echo $rootPath
# source getVideoLength
mp4Dir=$1

mp4File=$(cd $mp4Dir; ls | grep .mp4)
mp4=(${mp4File// / })
# echo ${mp4[0]}
for (( i = 0; i < ${#mp4[@]}; i++ )); do
  videoName=${mp4[i]}
  dirName="split/${videoName%%.*}"
  echo dirName
  mkdir $dirName
  echo $videoName
  # getVideoLength
done
