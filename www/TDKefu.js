var tdKefu= {
tdConnectKefu: function(paramDic,successCallback, errorCallback) {
    console.log("tdConnectKefu");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDKefu",
                 "tdConnectKefu",
                 [paramDic]
                 );
    
}
               ,
               
tdRegisterKefu: function(serviceKey,successCallback, errorCallback) {
    console.log("tdRegisterKefu");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDKefu",
                 "tdRegisterKefu",
                 [serviceKey]
                 );
               
               }
}

module.exports = tdKefu;
