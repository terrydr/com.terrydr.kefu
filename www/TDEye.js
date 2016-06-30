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
    
}

module.exports = tdKefu;