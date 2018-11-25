#!/bin/bash
echo "getVideoLength"
getTimeSeconds(){
  echo "getTimeSeconds"
  # time=$1
  # echo "第一个参数->$1"

  attr=(${result//:/ })
  hour=${attr[0]}
  min=${attr[1]}
  sec=${attr[2]}

  # echo ${{hour}}
  durationSecond=`expr $hour \* 60 \* 60 + $min \* 60 + $sec`

}

# fileName=$1
# echo "begin $1"
echo $realPath/$mp4Dir/$fileName
durationSecond=0
# 2>&1 stderr重定向到stdout 标准错误重定向为标准输出 这样才能获取到信息 tee输出到文件
raw=`ffmpeg -i $realPath/$mp4Dir/$fileName 2>&1 | grep Duration`
##关于字符串截取 -> https://www.cnblogs.com/zwgblog/p/6031256.html
right=${raw#*Duration:}
result=${right%%.*}

echo "raw is ----> $raw"
echo "right is ----> $right"
echo "result is ----> $result"

getTimeSeconds

echo $durationSecond

echo "durationSecond is ----> $durationSecond"
