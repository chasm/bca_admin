BridgeCity.on("initialize:before", function(options){
  console.log("--> Event: initialize:before");
});

BridgeCity.on("initialize:after", function(options){
  console.log("--> Event: initialize:after");
  if (Backbone.history) { Backbone.history.start({ pushState: true }); }
});

BridgeCity.on("start", function(options){
  console.log("--> Event: start");
});

BridgeCity.start();