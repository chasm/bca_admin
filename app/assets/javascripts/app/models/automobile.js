BridgeCity.Automobile = Backbone.RelationalModel.extend({
  urlRoot: '/api/automobiles',
  
  relations: [
    {
      type: Backbone.HasMany,
      key: 'credit_applications',
      relatedModel: 'BridgeCity.CreditApplication',
      reverseRelation: {
        type: Backbone.HasOne,
        key: 'automobile'
      }
    }
  ],

  initialize: function() {
    "use strict";
    
    if (!this.id) { this.set("id", BridgeCity.getUuid()); }
  },
  
  defaults: {
    style: 'sedan',
    status: 'available'
  },
  
  validate: function(attrs) {
    var out, yr;
    
    out = new Object();
    yr = moment().year() + 1;
    
    if (!attrs.stock_number) {
      out.stock_number = "A vehicle stock number is required."
    }
    
    if (!attrs.year) {
      out.year = "A vehicle year is required."
    } else if (!_.isNumber(attrs.year) || attrs.year < 1910 || attrs.year > yr) {
      out.year = "Vehicle year must be between 1910 and " + yr + ".";
    }
    
    if (!attrs.make) {
      out.make = "A make of vehicle is required."
    }
    
    if (!attrs.model) {
      out.model = "A vehicle model is required."
    }
    
    if (_.indexOf(BridgeCity.styles, attrs.style) === -1) {
      out.style = "The vehicle body style must be one of <%= Automobile.styles.join(', ') %>."
    }
    
    if (!attrs.color) {
      out.color = "A vehicle color is required."
    }
    
    if (!attrs.price) {
      out.price = "A vehicle price is required."
    } else if (!_.isInt(attrs.price)) {
      out.price = "The vehicle price must be in dollars only (no cents).";
    }
    
    if (_.indexOf(BridgeCity.statuses, attrs.status) === -1) {
      out.status = "The vehicle status must be one of <%= Automobile.statuses.join(', ') %>."
    }
    
    if (!_.isEmpty(out)) { return out; }
  },
  
  name: function() {
    "use strict";
    
    return [this.get("year"), this.get("make"), this.get("model")].join(' ');
  },
  
  fresh: function() {
    "use strict";
    
    return _.has(this.changed, 'id');
  }
});