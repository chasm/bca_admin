//= require_tree ./config
//= require_self
//= require_tree ./apps
//= require ./start

@BridgeCity = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.addRegions
		headerRegion: "#header_region"
		mainRegion: "#main_region"
		footerRegion: "#footer_region"
	
	App.addInitializer ->
		App.module("FooterApp").start()
	
	App.on "initialize:after", ->
		if Backbone.history
			Backbone.history.start({pushState: true})
	
	App
