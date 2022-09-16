
mwan3 stop

/sbin/ifdown wan
/sbin/ifdown wan2
/sbin/ifdown wan3

sleep 300

mwan3 stop
/sbin/ifup wan
mwan3 stop
sleep 10
/root/autoLoginMain.sh

mwan3 stop
/sbin/ifdown wan
/sbin/ifup wan2
mwan3 stop
sleep 10
/root/autoLoginMain.sh

mwan3 stop
/sbin/ifdown wan2
/sbin/ifup wan3
mwan3 stop
sleep 10
/root/autoLoginMain.sh

/sbin/ifup wan
/sbin/ifup wan2
/sbin/ifup wan3

mwan3 start
sleep 10
mwan3 restart