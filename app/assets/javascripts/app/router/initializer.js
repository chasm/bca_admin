BridgeCity.addInitializer(function(options){
  console.log("--> Initializer: router");
  this.router = new BridgeCity.Router();
  Backbone.history.start({ pushState: true });
});
