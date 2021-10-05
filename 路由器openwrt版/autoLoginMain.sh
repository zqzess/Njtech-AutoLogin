#Njtech自动登录
#zqzess
#主程序
echo "*****************开始自动登录***************"
#sleep 120
echo "**************当前时间$(date)**************"
rm /root/data.txt
curl -i 'https://u.njtech.edu.cn/cas/login?service=https://u.njtech.edu.cn/oauth2/authorize?client_id=Oe7wtp9CAMW0FVygUasZ&response_type=code&state=njtech' >> /root/data.txt

cat /root/data.txt|while read line
do
a=$(grep -Eo "Set-Cookie.+; Path" | head -n 1);
new=${a: 12};
new=${new/' Path'/}
echo new_cookie:$new
#tmp3="-H 'Cookie: ${new}";
cookie="-H 'Cookie: "$new;
echo new_cookie2:$cookie
sed -i "7c${cookie}" /root/login.sh
sed -i "s/-H 'Cookie/  &/" /root/login.sh
#sed -n -e "7p" login.sh
done

cat /root/data.txt|while read line
do
a=$(grep -Eo "insert_cookie.+");
tmp=${a/'; path='/"'"}
tmp=${tmp/\//}
new=${tmp}
echo new_cookie3:$new
sed -i "s/JSESSIONID.*/& ${new}/g" /root/login.sh
sed -i 's/JSESSIONID.*/&\\/' /root/login.sh
done

cat /root/data.txt|while read line
do
b=$(grep  'name="lt"' | head -n 1)
tmp=${b/'<input type="hidden" name="lt" value="'/}
lt="lt="${tmp%'"'*}
lt=${lt/'						'/}
echo new_lt:$lt
old=$(grep -Eo "lt=.+&execution" login.sh)
old=${old/'&execution'/}
old=${old/'						'/}
echo old_lt:$old
sed -i "s/${old}/$lt/" /root/login.sh
#sed -n -e "8p" login.sh
done

cat /root/data.txt|while read line
do
b=$(grep  'name="execution"' | head -n 1)
tmp=${b/'type="hidden" name="execution" value="'/}
execution="execution="${tmp%'"'*}
execution=${execution/'							'/}
echo new_execution:$execution
old=$(grep -Eo "execution=.+&_eventId" login.sh)
old=${old/'&_eventId'/}
echo old_execution:$old
sed -i "s/${old}/$execution/" /root/login.sh
done

/root/login.sh







