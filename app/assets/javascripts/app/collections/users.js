BridgeCity.Users = Backbone.Collection.extend({
  model: BridgeCity.User,
  url: '/api/users'
});
