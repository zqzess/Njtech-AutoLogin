# Njtech-AutoLogin

南京工业大学校园网(智慧南工)自动登录

**python版已封装打包，可运行在win平台上**

### windows系统设置开机任务

1. `win`+`R`键，输入``shell:startup``并确定将会打开一个文件夹
2. 将解压后文件夹内的快捷方式放入弹窗打开的文件夹内
3. 在config.ini内按说明修改账户密码和运营商，以后重启电脑将会自动登录校园网

### openwrt路由器版设置开机任务

假设脚本存放于``/root``内

1. 修改login.sh 脚本内账号密码运营商
2. /etc/rc.local内添加``/root/autoLoginMain.sh``
   
### mac系统自动登录

***mac上可以使用[Hammerspoon](https://www.hammerspoon.org/)实现切换wifi自动化登录***

[Hammerspoon自动化脚本参考-->](https://github.com/zqzess/Hammerspoon-config/blob/main/autoLogin/autoLogin.lua)

修改login.sh内`--data-raw`下的``'username=201921221232&password=11112312``uersname与password的值

默认电信，如果要换中国移动请对`中国移动`进行UrlEncode,然后替换`--data-raw`下的`channelshow`的值，并替换`channel`的值为``%40cmcc``