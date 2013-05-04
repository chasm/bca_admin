//= require_self
//
//= require ./models/automobile
//= require ./models/credit_application
//= require ./models/login
//= require ./models/user
//= require ./models/initializer
//
//= require ./collections/automobiles
//= require ./collections/credit_applications
//= require ./collections/users
//= require ./collections/initializer
//
//= require ./templates/templates
//
//= require_tree ./views
//
//= require ./router/router
//= require ./router/initializer
//
//= require ./start

BridgeCity = new Backbone.Marionette.Application();

BridgeCity.Layout = MyLayout = Backbone.Marionette.Layout.extend({
  regions: {
    prologue: '#header_region',
    content: '#main_region',
    epilogue: '#footer_region'
  }
});
