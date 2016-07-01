var tdKefu= {
tdConnectKefu: function(successCallback, errorCallback) {
    console.log("tdConnectKefu");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDKefu",
                 "tdConnectKefu",
                 []
                 );
    
}
               ,
               
tdRegisterKefu: function(successCallback, errorCallback) {
    console.log("tdRegisterKefu");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDKefu",
                 "tdRegisterKefu",
                 []
                 );
               
               }
}

module.exports = tdKefu;
