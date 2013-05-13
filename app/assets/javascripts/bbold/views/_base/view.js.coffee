@BridgeCity.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  _remove = Marionette.View::remove

  _.extend Marionette.View::,

    remove: (args...) ->
      console.log "removing", @
      _remove.apply @, args

    templateHelpers: ->

      linkTo: (name, url, options = {}) ->
        _.defaults options
          external: false

      currentUser:
        App.request("get:current:user").toJSON()