//
//= require_tree ./config
//= require_self
//= require_tree ./utils
//= require_tree ./entities
//= require_tree ./views
//= require_tree ./apps
//= require ./start
//

@BridgeCity = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = Routes.users_path()

  App.on "initialize:before", (options) ->
    @currentUser = App.request "set:current:user", options.currentUser

  App.reqres.setHandler "get:current:user", ->
    App.currentUser

  App.addRegions
    headerRegion: "#header_region"
    mainRegion: "#main_region"
    footerRegion: "#footer_region"

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()

  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start({pushState: true})
      @navigate(@rootRoute, {trigger: true}) if @getCurrentRoute() is ""

  App

