@BridgeCity.module "AutomobilesApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listAutomobiles: ->
      App.request "automobile:entities", (automobiles) =>

        @layout = @getLayoutView()

        @layout.on "show", =>
          @showPanel automobiles
          @showAutomobiles automobiles

        App.mainRegion.show @layout

    showPanel: (automobiles) ->
      panelView = @getPanelView automobiles
      @layout.panelRegion.show panelView

    showAutomobiles: (automobiles) ->
      automobilesView = @getAutomobilesView automobiles
      @layout.automobilesRegion.show automobilesView

    getPanelView: (automobiles) ->
      new List.Panel
        collection: automobiles

    getAutomobilesView: (automobiles) ->
      new List.Automobiles
        collection: automobiles

    getLayoutView: ->
      new List.Layout
