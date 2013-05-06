@Birchis.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    list: ->
      links = App.request "header:entities"
      window.links = links

      listView = @getListView links
      App.headerRegion.show listView

    getListView: (links) ->
      new List.Headers
        collection: links
