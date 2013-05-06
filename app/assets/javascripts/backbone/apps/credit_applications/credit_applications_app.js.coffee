@BridgeCity.module "CreditApplicationsApp", (CreditApplicationsApp, App, Backbone, Marionette, $, _) ->

  class CreditApplicationsApp.Router extends Marionette.AppRouter
    appRoutes:
      "credit_apps" : "listCreditApplications"

  API =
    listCreditApplications: ->
      CreditApplicationsApp.List.Controller.listCreditApplications()

  App.addInitializer ->
    new CreditApplicationsApp.Router
      controller: API

