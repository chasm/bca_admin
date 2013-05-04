BridgeCity.UserCollection = Backbone.Collection.extend({
  model: BridgeCity.User,
  url: '/api/users'
});

BridgeCity.Users = Marionette.Controller.extend({
  getAll: function() {
    console.log(" -> Retrieving all users");
  },
  
  getAdministrators: function() {
    console.log(" -> Retrieving administrators");
  },
  
  getCustomers: function() {
    console.log(" -> Retrieving customers");
  },
  
  getNewCustomers: function() {
    console.log(" -> Retrieving new customers");
  },
  
  getOldCustomers: function() {
    console.log(" -> Retrieving old customers");
  },
  
  getById: function(id) {
    console.log(" -> Retrieving the customer with ID " + id);
  },

  _getUsers: function(callback){
    var userCollection = new UserCollection();
    userCollection.on("reset", callback);
    userCollection.fetch();
  }
});