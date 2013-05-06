@BridgeCity.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Automobile extends Entities.Model

  class Entities.AutomobileCollection extends Entities.Collection
    model: Entities.Automobile
    url: -> Routes.automobiles_path()

  API =
    setCurrentAutomobile: (currentAutomobile) ->
      new Entities.Automobile currentAutomobile
      
    getAutomobileEntities: (cb) ->
      automobiles = new Entities.AutomobileCollection
      automobiles.fetch
        success: ->
          cb automobiles

  App.reqres.setHandler "set:current:automobile", (currentAutomobile) ->
    API.setCurrentAutomobile currentAutomobile 

  App.reqres.setHandler "automobile:entities", (cb) ->
    API.getAutomobileEntities cb
