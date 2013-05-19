//= require ../vendor/handlebars-1.0.0-rc.3
//= require ../vendor/ember-1.0.0-rc.3
//= require ../vendor/ember-data

BCAuto = Ember.Application.create();

BCAuto.Router.map(function() {
  // put your routes here
});

BCAuto.IndexRoute = Ember.Route.extend({
  model: function() {
    return ['red', 'yellow', 'blue'];
  }
});




BCAuto.topBarView = Ember.View.create({
  templateName: 'top-bar'
});

BCAuto.headerView = Ember.View.create({
  templateName: 'header'
});

BCAuto.breadcrumbsView = Ember.View.create({
  templateName: 'breadcrumbs'
});

BCAuto.footerView = Ember.View.create({
  templateName: 'footer'
});

BCAuto.topBarView.appendTo(".container");
BCAuto.headerView.appendTo(".container");
BCAuto.breadcrumbsView.appendTo(".container");
BCAuto.footerView.appendTo(".container");