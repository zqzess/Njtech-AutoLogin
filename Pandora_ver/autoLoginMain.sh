

echo "*****************开始自动登录***************"
#sleep 120
echo "**************当前时间$(date)**************"
rm /root/data.txt
curl -i 'https://u.njtech.edu.cn/cas/login?service=https://u.njtech.edu.cn/oauth2/authorize?client_id=Oe7wtp9CAMW0FVygUasZ&response_type=code&state=njtech' >> /root/data.txt


a=$(grep -Eo "Set-Cookie.+; Path" /root/data.txt| head -n 1);
new=${a:12};
str_1=${new/' Path'/}
echo $str_1

a=$(grep -Eo "insert_cookie.+" /root/data.txt);
tmp=${a/'; path='/"'"}
tmp=${tmp/\//}
str_2=$(echo $tmp)
echo $str_2

sed -i 7c"\  -H 'Cookie: $str_1 $str_2 \\"  /root/login.sh


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