#Njtech校园网自动登录
#zqzess
#登录
curl -i 'https://u.njtech.edu.cn/cas/login?service=https%3A%2F%2Fu.njtech.edu.cn%2Foauth2%2Fauthorize%3Fclient_id%3DOe7wtp9CAMW0FVygUasZ%26response_type%3Dcode%26state%3Dnjtech%26s%3Df682b396da8eb53db80bb072f5745232' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36 Edg/94.0.992.31' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cookie: JSESSIONID=4530D7BDE2EF730D1DEDB0415C17D307.TomcatC; insert_cookie=97324480' \
  --data-raw 'username=201921221232&password=11112312&channelshow=%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1&channel=%40telecom&lt=LT-19012837-HOGReOBbI4J5WXGP4cddwWJ7dZyBad&execution=e1s1&_eventId=submit&submit=%E7%99%BB%E5%BD%95'
