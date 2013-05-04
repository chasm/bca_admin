BridgeCity.CreditApplicationCollection = Backbone.Collection.extend({
  model: BridgeCity.CreditApplication,
  url: '/api/credit_applications'
});

BridgeCity.CreditApplications = Marionette.Controller.extend({
  getAll: function() {
    console.log(" -> Retrieving all credit applications");
  },
  
  getNew: function() {
    console.log(" -> Retrieving new credit applications");
  },
  
  getPending: function() {
    console.log(" -> Retrieving pending credit applications");
  },
  
  getApproved: function() {
    console.log(" -> Retrieving approved credit applications");
  },
  
  getDenied: function() {
    console.log(" -> Retrieving denied credit applications");
  },
  
  getById: function(id) {
    console.log(" -> Retrieving the credit application with ID " + id);
  },

  _getCreditApplications: function(callback){
    var creditApplicationCollection = new CreditApplicationCollection();

    console.log(" -> _getCreditApplications called");
    
    creditApplicationCollection.on("reset", callback);
    creditApplicationCollection.fetch();
  }
});