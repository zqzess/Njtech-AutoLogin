部署于PandoraBox固件路由上的自动登录

基于shell，无Python环境也可使用  
Pandora和Ubuntu环境均测试通过

修复：  
-修复了login中反复添加 curl -H 导致报错/需要运行2遍才能执行的问题  
-修复了在PandoraBox中无法工作的问题  

添加功能：  
-添加flush.sh，使用mwan3的设备可以参照模版执行多端口登录  
-在flush.sh中执行主动断连，24h在线设备可设置计划任务避免断网  
-可结合hotplug事件重连端口

食用方法：  
与openwrt_ver大致相同，需要修改login.sh中的账户密码及运营商  
PS：群中说明文档将电信和移动写反了，电信为telecom，移动为cmcc
