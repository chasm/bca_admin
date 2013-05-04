BridgeCity.CreditApplication = Backbone.RelationalModel.extend({
  urlRoot: '/api/credit_applications',
  
  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  name: function() {
    "use strict";
    
    return this.get("drivers_license_number");
  },
  
  fresh: function() {
    "use strict";
    
    return _.has(this.changed, 'id');
  }
});
