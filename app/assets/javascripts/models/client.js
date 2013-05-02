BridgeCity.Client = Backbone.Model.extend({
  urlRoot: '/users',
  
  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  name: function() {
    "use strict";
    
    return [this.get("name_first"), this.get("name_mi"), this.get("name_last")].join(' ');
  }
});
