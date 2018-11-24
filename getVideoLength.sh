#!/bin/bash
echo "begin $1"
# 2>&1 stderr重定向到stdout 标准错误重定向为标准输出 这样才能获取到信息 tee输出到文件
raw=`ffmpeg -i baoxue.mp4 2>&1 | grep Duration | tee mylog.log`
##关于字符串截取 -> https://www.cnblogs.com/zwgblog/p/6031256.html
right=${raw#*Duration:}
result=${right%%.*}

echo "raw is ----> $raw"
echo "right is ----> $right"
echo "result is ----> $result"
