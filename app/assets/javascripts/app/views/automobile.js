BridgeCity.AutomobileRowView = Backbone.Marionette.ItemView.extend({
  tagName: 'tr',
  className: 'automobile_row',
  template: BridgeCity.autoRowTemplate,
  model: BridgeCity.Automobile
});

BridgeCity.AutomobilesView = Backbone.Marionette.CompositeView.extend({
  template: BridgeCity.autoListTemplate
})