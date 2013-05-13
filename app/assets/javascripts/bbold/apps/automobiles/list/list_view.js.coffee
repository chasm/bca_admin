@BridgeCity.module "AutomobilesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "automobiles/list/templates/list_layout"

    regions:
      panelRegion: "#panel_region"
      automobilesRegion: "#automobiles_region"

  class List.Panel extends App.Views.ItemView
    template: "automobiles/list/templates/_panel"

  class List.Automobile extends App.Views.ItemView
    template: "automobiles/list/templates/_automobile"
    tagName: "tr"

  class List.Empty extends App.Views.ItemView
    template: "automobiles/list/templates/_empty"
    tagName: "tr"

  class List.Automobiles extends App.Views.CompositeView
    template: "automobiles/list/templates/_automobiles"
    itemView: List.Automobile
    emptyView: List.Empty
    itemViewContainer: "tbody"