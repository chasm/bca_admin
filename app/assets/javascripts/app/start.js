BridgeCity.on("initialize:before", function(options){
  console.log("--> Event: initialize:before");
});

BridgeCity.on("initialize:after", function(options){
  console.log("--> Event: initialize:after");
});

BridgeCity.on("start", function(options){
  console.log("--> Event: start");
});

BridgeCity.start();