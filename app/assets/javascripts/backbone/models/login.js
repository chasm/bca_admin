BridgeCity.Login = Backbone.RelationalModel.extend({
  urlRoot: '/api/logins',
  
  defaults: {
    userId: ''
  },
  
  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  fresh: function() {
    "use strict";
    
    return _.has(this.changed, 'id');
  }
});
