@BridgeCity.module "CreditApplicationsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listCreditApplications: ->
      App.request "creditApplication:entities", (creditApplications) =>

        @layout = @getLayoutView()

        @layout.on "show", =>
          @showPanel creditApplications
          @showCreditApplications creditApplications

        App.mainRegion.show @layout

    showPanel: (creditApplications) ->
      panelView = @getPanelView creditApplications
      @layout.panelRegion.show panelView

    showCreditApplications: (creditApplications) ->
      creditApplicationsView = @getCreditApplicationsView creditApplications
      @layout.creditApplicationsRegion.show creditApplicationsView

    getPanelView: (creditApplications) ->
      new List.Panel
        collection: creditApplications

    getCreditApplicationsView: (creditApplications) ->
      new List.CreditApplications
        collection: creditApplications

    getLayoutView: ->
      new List.Layout
