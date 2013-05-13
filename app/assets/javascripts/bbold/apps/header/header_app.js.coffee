@BridgeCity.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    listHeader: ->
      HeaderApp.List.Controller.list()

  HeaderApp.on "start", ->
    API.list()
