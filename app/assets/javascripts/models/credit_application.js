BridgeCity.CreditApplication = Backbone.Model.extend({
  urlRoot: '/credit_applications',
  
  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  name: function() {
    "use strict";
    
    return this.get("drivers_license_number");
  }
});
