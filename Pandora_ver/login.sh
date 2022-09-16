

curl -i 'https://u.njtech.edu.cn/cas/login?service=https%3A%2F%2Fu.njtech.edu.cn%2Foauth2%2Fauthorize%3Fclient_id%3DOe7wtp9CAMW0FVygUasZ%26response_type%3Dcode%26state%3Dnjtech%26s%3Df682b396da8eb53db80bb072f5745232' \
  --data-raw 'username=username&password=password&channelshow=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&channel=%40cmcc&lt=LT-19255602-6bXlu96Q3IpcRsxVb3cUwvThHk6Kaj&execution=e1s1&_eventId=submit&submit=%E7%99%BB%E5%BD%95' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Cookie: JSESSIONID=F1B99D5F98E44D5DF4C036B882366CED.TomcatC; insert_cookie=97324480'
 

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
/root/login.sh >> /root/runlog.txt
fi