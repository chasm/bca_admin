BridgeCity.Logins = Backbone.Collection.extend({
  model: BridgeCity.Login,
  userId: '',
  url: '/api/users' + this.userId + '/logins'
});
