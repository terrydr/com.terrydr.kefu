cordova-plugin-qykefu
-------------------------------
####七鱼云客服cordova插件

支持平台：iOS Android

安装：cordova plugin add https://github.com/terrydr/com.terrydr.kefu.git

卸载：cordova plugin rm cordova-plugin-qykefu

示例：

    //注册key
    tdkefu.tdRegisterKefu(sessionTitle,userId,userData,successCallback, errorCallback);
    //打开客服
    tdkefu.tdConnectKefu(serviceKey,appName,successCallback, errorCallback);
