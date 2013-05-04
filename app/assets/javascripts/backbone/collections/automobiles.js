BridgeCity.AutomobileCollection = Backbone.Collection.extend({
  model: BridgeCity.Automobile,
  url: '/api/automobiles'
});

BridgeCity.Automobiles = Marionette.Controller.extend({
  getAll: function() {
    console.log(" -> Retrieving all automobiles");
    
    var deferred = $.Deferred();

    this._getAutomobiles(function(autos){
      deferred.resolve(autos);
    });

    return deferred.promise();
  },
  
  getAvailable: function() {
    console.log(" -> Retrieving available automobiles");
  },
  
  getPending: function() {
    console.log(" -> Retrieving pending automobiles");
  },
  
  getSold: function() {
    console.log(" -> Retrieving sold automobiles");
  },
  
  getById: function(id) {
    console.log(" -> Retrieving the automobile with ID " + id);
  },

  _getAutomobiles: function(callback){
    var automobileCollection = new AutomobileCollection();
    automobileCollection.on("reset", callback);
    automobileCollection.fetch();
  }
});
