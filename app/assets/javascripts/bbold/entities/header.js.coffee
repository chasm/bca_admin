@BridgeCity.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Header extends Entities.Model

  class Entities.HeaderCollection extends Entities.Collection
    model: Entities.Header

  API =
    getHeaders: ->
      new Entities.HeaderCollection [
        { name: "Autos", url: Routes.autos_path() }
        { name: "Credit Apps", url: Routes.credit_apps_path() }
        { name: "Users", url: Routes.clients_path() }
      ]

  App.reqres.setHandler "header:entities", ->
    API.getHeaders()
