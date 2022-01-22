#Njtech自动登录
#zqzess
#启动程序
echo "------------------------------启动程序开始执行------------------------------"
echo $(date)
echo "\n自动检查日志文件夹是否存在"
if ls log 2>&1
then
  echo "日志文件夹存在"
else
  echo "日志文件夹不存在，将创建"
  mkdir log
fi
echo "\n自动检查缓存文件夹是否存在"
if ls cache 2>&1
then
  echo "缓存文件夹存在"
else
  echo "缓存文件夹不存在，将创建"
  mkdir cache
fi
rm ./log/login.log
rm ./log/main.log
echo "\n"
./main.sh
sleep 3
timeout=5
target=www.baidu.com
#获取响应状态码
i=1
sum=0
while [ $i -le 100 ]
do
ret_code=`curl -I -s --connect-timeout $timeout $target -w %{http_code} | tail -n1`
  if [ "x$ret_code" = "x200" ]; then
        #网络畅通
        time=$(date)
        echo $(date)
        echo "登录成功"
        i=101
        #curl https://api.day.app/           /Njtech登录成功/"${time}"?group=NjtechLogin
  else
    #网络不畅通
      let sum=sum+$i
      let i++
      echo $(date)
      echo "登录失败"
      echo "准备重试第${i}次"
      sleep 3
      ./main.sh >> ./log/main.log
      ./login.sh >> ./log/login.log
    fi
echo "------------------------------结束------------------------------"
echo "\n"
done