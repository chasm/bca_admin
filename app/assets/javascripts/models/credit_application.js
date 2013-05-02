BridgeCity.CreditApplication = Backbone.RelationalModel.extend({
  urlRoot: '/api/credit_applications',
  
  relations: [
    {
      type: Backbone.HasOne,
      key: 'automobile',
      relatedModel: 'BridgeCity.Automobile',
      reverseRelation: {
        type: Backbone.HasMany,
        key: 'credit_applications'
      }
    },
    {
      type: Backbone.HasOne,
      key: 'user',
      relatedModel: 'BridgeCity.Automobile',
      reverseRelation: {
        type: Backbone.HasMany,
        key: 'credit_applications'
      }
    }
  ],
  
  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  name: function() {
    "use strict";
    
    return this.get("drivers_license_number");
  }
});
