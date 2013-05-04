//= require_self
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./templates
//= require_tree ./views
//= require_tree ./router
//= require ./start

BridgeCity = new Backbone.Marionette.Application();

BridgeCity.addRegions({
  prologue: '#prologue_region',
  content: '#content_region',
  epilogue: '#epilogue_region'
});
