BridgeCity.User = Backbone.RelationalModel.extend({
  urlRoot: '/api/users',
  
  relations: [
    {
      type: Backbone.HasMany,
      key: 'credit_applications',
      relatedModel: 'BridgeCity.CreditApplication',
      reverseRelation: {
        key: 'automobile',
        includeInJSON: 'id'
      }
    }
  ],
  
  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  name: function() {
    "use strict";
    
    return [this.get("name_first"), this.get("name_mi"), this.get("name_last")].join(' ');
  }
});
