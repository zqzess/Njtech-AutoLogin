#Njtech校园网自动登录
#zqzess
#登录
curl -i 'https://u.njtech.edu.cn/cas/login?service=https%3A%2F%2Fu.njtech.edu.cn%2Foauth2%2Fauthorize%3Fclient_id%3DOe7wtp9CAMW0FVygUasZ%26response_type%3Dcode%26state%3Dnjtech%26s%3Df682b396da8eb53db80bb072f5745232' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36 Edg/94.0.992.31' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cookie: JSESSIONID=7672E44B0CD6935270BA94EC799E0DCB.TomcatB; insert_cookie=67313298'
\
  --data-raw 'username=&password=&channelshow=%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1&channel=%40telecom&lt=LT-24232-bgUFAVUa7pIf1JKSH4gwydnILcssm2&execution=e1s1&_eventId=submit&submit=%E7%99%BB%E5%BD%95'

sleep 3
timeout=5
target=www.baidu.com
#获取响应状态码
ret_code=`curl -I -s --connect-timeout $timeout $target -w %{http_code} | tail -n1`
if [ "x$ret_code" = "x200" ]; then
#网络畅通
time=$(date)
#curl https://api.day.app/           /Njtech登录成功/"${time}"?group=NjtechLogin
else
#网络不畅通
/root/Login.sh >> /root/runlog.txt
fi