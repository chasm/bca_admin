@BridgeCity.module "AutomobilesApp", (AutomobilesApp, App, Backbone, Marionette, $, _) ->

  class AutomobilesApp.Router extends Marionette.AppRouter
    appRoutes:
      "autos" : "listAutomobiles"

  API =
    listAutomobiles: ->
      AutomobilesApp.List.Controller.listAutomobiles()

  App.addInitializer ->
    new AutomobilesApp.Router
      controller: API

