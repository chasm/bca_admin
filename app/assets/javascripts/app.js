/* global _, BridgeCity, Backbone */

//= require back
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require router
//= require templates
//= require_self

$(function(){
  "use strict";
  
  BridgeCity.getItem = function(id, coll, callback, redirect) {
    var item;
    
    item = coll.get(id);
    
    if (item) {
      callback(item);
    } else {
      coll.fetch({
        success: function() {
          var item;
          
          item = coll.get(id);
          if (item) {
            callback(item);
          } else {
            BridgeCity.flash.errors.push("Can't find item with ID #" + id + ".");
            BridgeCity.router.navigate(redirect, {trigger: true});
          }
        }
      });
    }
  };

  BridgeCity.showAutosList = function(autos) {
    var btn, templ, available, pending, sold;
    
    btn = BridgeCity.templ_auto_new_button;
    templ = BridgeCity.templ_auto_list;
  
    available = autos.where({status: 'available'});
    pending = autos.where({status: 'pending'});
    sold = autos.where({status: 'sold'});
  
    $('#insert_view_here').append(btn());
  
    if (available.length > 0) {
      $('#insert_view_here').append(templ({autos: available, caption: 'For sale'}));
    } else {
      $('#insert_view_here').append(_.template('<div class="well">There are no autos available for sale.</div>'));
    }
    
    if (pending.length > 0) {
      $('#insert_view_here').append(templ({autos: pending, caption: 'Pending'}));
    } else {
      $('#insert_view_here').append(_.template('<div class="well">There are no pending sales.</div>'));
    }
    
    if (sold.length > 0) {
      $('#insert_view_here').append(templ({autos: sold, caption: 'Sold'}));
    } else {
      $('#insert_view_here').append(_.template('<div class="well">No autos have been sold.</div>'));
    }
      
  };

  BridgeCity.showAutoDetail = function(auto) {
    var templ;
    
    templ = BridgeCity.templ_auto_detail;
  
    $('#insert_view_here').html(templ({auto: auto}));
  };

  BridgeCity.showAutoForm = function(auto) {
    var templ;
    
    templ = BridgeCity.templ_auto_form;
  
    $('#insert_view_here').html(templ({auto: auto}));
  
    $('#form_for_autos').on('submit', function(){
      var id, auto;
      
      id   = $('#auto_id').val();
      auto = BridgeCity.autos.get(id);
    
      auto.set('stock_number', $('#auto_stock_number').val());
      auto.set('make', $('#auto_make').val());
      auto.set('model', $('#auto_model').val());
      auto.set('year', $('#auto_year').val());
      auto.set('color', $('#auto_color').val());
      auto.set('style', $('#auto_style').val());
      auto.set('price', $('#auto_price').val());
      auto.set('doors', $('#auto_doors').val());
      auto.set('displacement', $('#auto_displacement').val());
      auto.set('cylinders', $('#auto_cylinders').val());
      auto.set('mileage', $('#auto_mileage').val());
      auto.set('special_features', $('#auto_special_features').val());
      auto.set('nice_to_have', $('#auto_nice_to_have').val());
      auto.set('extras', $('#auto_extras').val());
      auto.set('status', $('#auto_status').val());
    
      $('#form_for_autos button').each(function(){
        var attr;
        
        attr = $(this).data('attr');
        
        auto.set(attr, $(this).hasClass('active') ? true : false);
      });
    
      console.log("Validating the auto: " + auto.validate());
      console.log("Saving the auto: " + auto.save());
    
      BridgeCity.router.navigate('auto/' + auto.id, {trigger: true});
      
      $("html, body").animate({ scrollTop: 0 }, "slow");
    
      return false;
    });
  };



  BridgeCity.autos = new BridgeCity.Automobiles();
  BridgeCity.apps = new BridgeCity.CreditApplications();
  BridgeCity.clients = new BridgeCity.Clients();
  BridgeCity.router = new BridgeCity.Router();

  BridgeCity.router.on('all', BridgeCity.resetNavigation);

  if (Backbone.history.start({pushState: true})) {
    console.log("--> Backbone has started");
  }

  BridgeCity.resetNavigation();
});
