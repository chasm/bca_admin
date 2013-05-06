@BridgeCity.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  
  uuids = []
  
  @addIds = (ids) ->
    Array::push.apply uuids, ids
  
  @getId = ->
    uuid = uuids.pop()
    loadIds() if uuids.length < 10
    uuid
    
  loadIds = =>
    $.ajax
      method: 'GET'
      url: '/uuids/100'
      dataType: 'json'
      success: (data) =>
        @addIds data
    