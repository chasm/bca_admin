BridgeCity.Router = Backbone.Router.extend({
  initialize: function(){
    this.route("", "home", this.index);
  
    this.route("autos", "autos", this.autos);
    this.route("autos/new", "addAnAuto", this.autoNew);
    this.route("auto/:id", "showAnAuto", this.autoShow);
    this.route("auto/:id/edit", "editAnAuto", this.autoEdit);
  
    this.route("apps", "apps", this.apps);
  
    this.route("users", "users", this.users);
  },

  index: function() {
    console.log("Welcome to the index page.");
  },

  autos: function() {
    BridgeCity.autos.fetch({
      reset: true,
      success: BridgeCity.showAutosList
    });
  },

  autoNew: function() {
    var auto;
    
    auto = new BridgeCity.Automobile();
    
    BridgeCity.showAutoForm(auto);
  },

  autoShow: function(id) {
    BridgeCity.getItem(id, BridgeCity.autos, BridgeCity.showAutoDetail, 'autos');
  },

  autoEdit: function(id) {
    BridgeCity.getItem(id, BridgeCity.autos, BridgeCity.showAutoForm, 'autos');
  },

  apps: function() {
    BridgeCity.apps = new BridgeCity.CreditApplications();
    
    BridgeCity.apps.fetch({
      reset: true,
      success: function(apps) {
        var models, templ;
        
        models = apps.models;
        templ  = _.template($('#app_list').html());
        
        $('#insert_view_here').html(templ({apps: models}));
      }
    });
  },

  users: function() {
    BridgeCity.users = new BridgeCity.Users();
    
    BridgeCity.users.fetch({
      reset: true,
      success: function(users) {
        var models, templ;
        
        models = users.models;
        templ  = _.template($('#user_list').html());
        
        $('#insert_view_here').html(templ({users: models}));
      }
    });
  }

});