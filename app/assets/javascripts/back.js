_.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
};

_.mixin({
  isInt: function(n) {
     return typeof n === 'number' && n % 1 == 0;
  }
});

window.BridgeCity = {
  uuids: [],
  
  flash: {
    notices: [],
    warnings: [],
    errors: []
  },
  
  loadUuids: function() {
    "use strict";
    
    $.ajax({
      method: 'GET',
      url: '/uuids/100',
      dataType: 'json',
      success: function(data){
        BridgeCity.uuids = data;
      }
    });
  },
  
  getUuid: function() {
    "use strict";
    
    if (BridgeCity.uuids.length < 10) { BridgeCity.loadUuids(); }
    
    return BridgeCity.uuids.pop();
  },
  
  toTitleCase: function(str) {
    "use strict";
    
    return str.replace(/\w*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
  },
  
  convertToText: function(str) {
    "use strict";
    
    switch (str){
      case undefined:
        return '<span class="n_a">n/a</span>';
      case true:
        return '<span class="yes">Yes</span>';
      default:
        return '<span class="no">No</span>';
    }
  },
  
  exists: function(test, out) {
    "use strict";
    
    if (test) {
      return out;
    } else {
      return "";
    }
  },
  
  resetNavigation: function() {
    "use strict";
    
    $('a[rel="router"]').off('click');
    
    $('a[rel="router"]').on('click', function(e) {
      console.log("Calling: " + e.target.pathname.substr(1));
      
      BridgeCity.router.navigate(e.target.pathname.substr(1), {trigger: true});
      
      return false;
    });
  }
};