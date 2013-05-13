@BridgeCity.module "CreditApplicationsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "credit_applications/list/templates/list_layout"

    regions:
      panelRegion: "#panel_region"
      creditApplicationsRegion: "#credit_apps_region"

  class List.Panel extends App.Views.ItemView
    template: "credit_applications/list/templates/_panel"

  class List.CreditApplication extends App.Views.ItemView
    template: "credit_applications/list/templates/_credit_application"
    tagName: "tr"

  class List.Empty extends App.Views.ItemView
    template: "credit_applications/list/templates/_empty"
    tagName: "tr"

  class List.CreditApplications extends App.Views.CompositeView
    template: "credit_applications/list/templates/_credit_applications"
    itemView: List.CreditApplication
    emptyView: List.Empty
    itemViewContainer: "tbody"