var tdKefu= {
tdConnectKefu: function(sessionTitle,userId,userData,successCallback, errorCallback) {
    console.log("tdConnectKefu");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDKefu",
                 "tdConnectKefu",
                 [sessionTitle,userId,userData]
                 );
    
}
               ,
               
tdRegisterKefu: function(serviceKey,appName,successCallback, errorCallback) {
    console.log("tdRegisterKefu");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDKefu",
                 "tdRegisterKefu",
                 [serviceKey,appName]
                 );
               
               }
}

module.exports = tdKefu;
