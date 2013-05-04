BridgeCity.siteNavigationTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <a rel="router" href="/" title="To the dashboard." class="brand">Bridge City Automotive</a>\n  <ul class="nav">\n    <li><a rel="router" href="/autos" title="Manage the autos for sale.">Autos</a></li>\n    <li><a rel="router" href="/apps" title="Manage the credit applications.">Apps</a></li>\n    <li><a rel="router" href="/users" title="Manage the client data.">Users</a></li>\n  </ul>\n  <ul class="nav pull-right">\n    <li><a href="/logout">Log out</a></li>\n  </ul>\n';
}
return __p;
}

BridgeCity.autoDetailTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <div class="row">\n    <div class="span12">\n      <h2 class="spaced-less">\n        '+
((__t=( auto.name() ))==null?'':__t)+
' #'+
((__t=( auto.get('stock_number') ))==null?'':__t)+
'\n        <span class="pull-right '+
((__t=( auto.get('status') ))==null?'':__t)+
'">\n          '+
((__t=( BridgeCity.toTitleCase(auto.get('status')) ))==null?'':__t)+
'\n          <a id="auto_edit_link" rel="router" href="/auto/'+
((__t=( auto.get('id') ))==null?'':__t)+
'/edit"\n            class="btn btn-inverse btn-medium" style="margin-top:-8px">Edit</a>\n        </span>\n      </h2>\n    </div>\n  </div>\n  <div class="row">\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption><span class="req">Identity</span></caption>\n        <tbody>\n          <tr>\n            <th>Stock number</th>\n            <td>'+
((__t=( auto.get('stock_number') ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Year</th>\n            <td>'+
((__t=( auto.get('year') ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Make</th>\n            <td>'+
((__t=( auto.get('make') ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Model</th>\n            <td>'+
((__t=( auto.get('model') ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption><span class="req">Price &amp; Body</span></caption>\n        <tbody>\n          <tr>\n            <th>Price</th>\n            <td>'+
((__t=( numeral(auto.get('price')).format("$0,0[.]00") ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Color</th>\n            <td>'+
((__t=( auto.get('color') ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Style</th>\n            <td>'+
((__t=( BridgeCity.toTitleCase(auto.get('style')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Doors</th>\n            <td>'+
((__t=( auto.get('doors') ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Status &amp; Engine</caption>\n        <tbody>\n          <tr>\n            <th>Status</th>\n            <td>'+
((__t=( BridgeCity.toTitleCase(auto.get('status')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Cylinders</th>\n            <td>'+
((__t=( auto.get('cylinders') ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Displacement</th>\n            <td>'+
((__t=( auto.get('displacement') ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <td colspan="2">&nbsp;</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Mileage &amp; Service</caption>\n        <tbody>\n          <tr>\n            <th>Mileage</th>\n            <td>\n              '+
((__t=( numeral(auto.get('mileage')).format('0,0[.]0') ))==null?'':__t)+
' miles\n            </td>\n          </tr>\n          <tr>\n            <th>Carfax</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('carfax')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Low miles</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('low_miles')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Fully serviced</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('fully_serviced')) ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Drivetrain &amp; brakes</caption>\n        <tbody>\n          <tr>\n            <th>Automatic</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('automatic')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Power brakes</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('power_brakes')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Antilock brakes</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('antilock_brakes')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>All-wheel drive</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('all_wheel_drive')) ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Steering</caption>\n        <tbody>\n          <tr>\n            <th>Power steering</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('power_steering')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Tilt steering</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('tilt_steering')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Telescoping steering</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('telescoping_steering')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <td colspan="2">&nbsp;</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Power Options</caption>\n        <tbody>\n          <tr>\n            <th>Cruise control</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('cruise_control')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Power windows</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('power_windows')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Power locks</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('power_locks')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Power mirrors</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('power_mirrors')) ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Climate control</caption>\n        <tbody>\n          <tr>\n            <th>Air conditioning</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('air_conditioning')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Automatic climate control</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('auto_climate_control')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Dual zone</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('dual_zone')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <td colspan="2">&nbsp;</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Entertainment</caption>\n        <tbody>\n          <tr>\n            <th>AM</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('am')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>FM</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('fm')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>CD</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('cd')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>MP3</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('mp3')) ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Interior</caption>\n        <tbody>\n          <tr>\n            <th>Leather</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('leather')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Heated front seats</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('heated_seats_front')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Heated rear seats</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('heated_seats_rear')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <td colspan="2">&nbsp;</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Exterior</caption>\n        <tbody>\n          <tr>\n            <th>Alloy wheels</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('alloy_wheels')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Roof rack</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('roof_rack')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Running boards</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('running_boards')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Tow package</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('tow_package')) ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Recent service</caption>\n        <tbody>\n          <tr>\n            <th>Recent brakes</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('recent_brakes')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Recent tires</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('recent_tires')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Recent paint</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('recent_paint')) ))==null?'':__t)+
'</td>\n          </tr>\n          <tr>\n            <th>Recent timing belt</th>\n            <td>'+
((__t=( BridgeCity.convertToText(auto.get('recent_timing_belt')) ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Special features</caption>\n        <tbody>\n          <tr>\n            <td class="special_features">'+
((__t=( auto.get('special_features') ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Nice-to-have features</caption>\n        <tbody>\n          <tr>\n            <td class="special_features">'+
((__t=( auto.get('nice_to_have') ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n    <div class="span3">\n      <table class="table table-bordered">\n        <caption>Extra features</caption>\n        <tbody>\n          <tr>\n            <td class="special_features">'+
((__t=( auto.get('extras') ))==null?'':__t)+
'</td>\n          </tr>\n        </tbody>\n      </table>\n    </div>\n  <div>\n';
}
return __p;
}

BridgeCity.autoFormTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <form id="form_for_autos" accept-charset="UTF-8" method="post" action="/automobiles/'+
((__t=( auto.get('id') ))==null?'':__t)+
'">\n    <h2>\n      ';
 if (auto.fresh()) { 
__p+='Add an auto for sale';
 } else { 
__p+='Edit detail for '+
((__t=( auto.get('stock_number') ))==null?'':__t)+
'';
 } 
__p+='\n      <span class="pull-right '+
((__t=( auto.get('status') ))==null?'':__t)+
'">\n        <a id="auto_show_link" rel="router" href="/auto/'+
((__t=( auto.get('id') ))==null?'':__t)+
'"\n          class="btn btn-danger btn-medium" style="margin-top:-8px">Cancel</a>\n      </span>\n    </h2>\n    <div id="form_for_autos_errors"></div>\n    <div class="row my-buttons">\n      <fieldset class="span3">\n        <legend>Identity (required)</legend>\n        <div style="margin:0;padding:0;display:inline">\n          <input name="utf8" type="hidden" value="✓">\n          <input name="_method" type="hidden" value="put">\n          <input name="authenticity_token" type="hidden" value="ChmxIRohnq39NOY7dDGdeC4EmOTRCR3acJPt2JDvibA=">\n          <input id="auto_id" name="id" type="hidden" value="'+
((__t=( auto.get('id') ))==null?'':__t)+
'">\n        </div>\n        <p>\n          <label for="auto_stock_number">Stock number</label>\n          <input type="text" id="auto_stock_number" name="automobile[stock_number]"\n            class="input-medium" autofocus="true" title="Stock number" value="'+
((__t=( auto.get('stock_number') ))==null?'':__t)+
'">\n        </p>\n        <p>\n          <label for="auto_year">Year</label>\n          <input type="text" id="auto_year" name="automobile[year]"\n            class="input-mini" title="Year" value="'+
((__t=( auto.get('year') ))==null?'':__t)+
'">\n        </p>\n        <p>\n          <label for="auto_make">Make</label>\n          <input type="text" id="auto_make" name="automobile[make]"\n            class="input-large" title="Make" value="'+
((__t=( auto.get('make') ))==null?'':__t)+
'">\n        </p>\n        <p>\n          <label for="auto_model">Model</label>\n          <input type="text" id="auto_model" name="automobile[model]"\n            class="input-large" title="Model" value="'+
((__t=( auto.get('model') ))==null?'':__t)+
'">\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Price &amp; Body (required)</legend>\n        <p>\n          <label for="auto_price">Price</label>\n          <span class="input-prepend">\n            <span class="add-on">$</span>\n            <input type="text" id="auto_price" name="automobile[price]"\n              class="input-mini" title="Price" value="'+
((__t=( auto.get('price') ))==null?'':__t)+
'">\n          </span>\n        </p>\n        <p>\n          <label for="auto_color">Color</label>\n          <input type="text" id="auto_color" name="automobile[color]"\n            class="input-large" title="Color" value="'+
((__t=( auto.get('color') ))==null?'':__t)+
'">\n        </p>\n        <p>\n          <label for="auto_style">Body style</label>\n          <select id="auto_style" name="automobile[style]"\n            class="span2" title="Body style">\n              <option value="sedan"';
 if (auto.get('style') === 'sedan') { 
__p+=' selected';
 } 
__p+='>Sedan</option>\n              <option value="sports car"';
 if (auto.get('style') === 'sports car') { 
__p+=' selected';
 } 
__p+='>Sports car</option>\n              <option value="hatchback"';
 if (auto.get('style') === 'hatchback') { 
__p+=' selected';
 } 
__p+='>Hatchback</option>\n              <option value="sports utility vehicle"';
 if (auto.get('style') === 'sports utility vehicle') { 
__p+=' selected';
 } 
__p+='>Sports utility vehicle</option>\n              <option value="minivan"';
 if (auto.get('style') === 'minivan') { 
__p+=' selected';
 } 
__p+='>Minivan</option>\n              <option value="microcar"';
 if (auto.get('style') === 'microcar') { 
__p+=' selected';
 } 
__p+='>Microcar</option>\n              <option value="station wagon"';
 if (auto.get('style') === 'station wagon') { 
__p+=' selected';
 } 
__p+='>Station wagon</option>\n              <option value="van"';
 if (auto.get('style') === 'van') { 
__p+=' selected';
 } 
__p+='>Van</option>\n              <option value="recreational vehicle"';
 if (auto.get('style') === 'recreational vehicle') { 
__p+=' selected';
 } 
__p+='>Recreational vehicle</option>\n              <option value="limousine"';
 if (auto.get('style') === 'limousine') { 
__p+=' selected';
 } 
__p+='>Limousine</option>\n              <option value="other"';
 if (auto.get('style') === 'other') { 
__p+=' selected';
 } 
__p+='>Other</option>\n          </select>\n        </p>\n        <p>\n          <label for="auto_doors">Doors</label>\n          <input type="text" id="auto_doors" name="automobile[doors]"\n            class="input-mini" title="Doors" value="'+
((__t=( auto.get('doors') ))==null?'':__t)+
'">\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Status &amp; Engine</legend>\n        <p>\n          <label for="auto_status">Status</label>\n          <select id="auto_status" name="automobile[status]"\n            class="span2" title="Status">\n              <option value="available"';
 if (auto.get('status') === 'available') { 
__p+=' selected';
 } 
__p+='>Available</option>\n              <option value="pending"';
 if (auto.get('status') === 'pending') { 
__p+=' selected';
 } 
__p+='>Pending</option>\n              <option value="sold"';
 if (auto.get('status') === 'sold') { 
__p+=' selected';
 } 
__p+='>Sold</option>\n          </select>\n        </p>\n        <p>\n          <label for="auto_cylinders">Cylinders</label>\n          <input type="text" id="auto_cylinders" name="automobile[cylinders]"\n            class="input-mini" title="Cylinders" value="'+
((__t=( auto.get('cylinders') ))==null?'':__t)+
'">\n        </p>\n        <p>\n          <label for="auto_displacement">Displacement</label>\n          <span class="input-append">\n            <input type="text" id="auto_displacement" name="automobile[displacement]"\n              class="input-mini" title="Displacement" value="'+
((__t=( auto.get('displacement') ))==null?'':__t)+
'">\n            <span class="add-on">liters</span>\n          </span>\n        </p>\n        <p class="form_cell">\n          &nbsp;\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Mileage &amp; Service</legend>\n        <p>\n          <span class="input-append">\n          <label for="auto_mileage">Mileage</label>\n            <input type="text" id="auto_mileage" name="automobile[mileage]"\n              class="input-medium" title="Mileage" value="'+
((__t=( auto.get('mileage') ))==null?'':__t)+
'">\n            <span class="add-on">miles</span>\n          </span>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('carfax')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="carfax">Carfax</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('low_miles')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="low_miles">Low Miles</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('fully_serviced')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="fully_serviced">Fully Serviced</button>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Drivetrain &amp; Brakes</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('automatic')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="automatic">Automatic</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('power_brakes')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="power_brakes">Power Brakes</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('antilock_brakes')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="antilock_brakes">Antilock Brakes</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('all_wheel_drive')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="all_wheel_drive">All Wheel Drive</button>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Steering</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('power_steering')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="power_steering">Power Steering</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('tilt_steering')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="tilt_steering">Tilt Steering</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('telescoping_steering')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="telescoping_steering">Telescoping Steering</button>\n        </p>\n        <p class="form_cell">\n          &nbsp;\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Power Options</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('cruise_control')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="cruise_control">Cruise Control</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('power_windows')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="power_windows">Power Windows</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('power_locks')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="power_locks">Power Locks</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('power_mirrors')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="power_mirrors">Power Mirrors</button>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Climate Control</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('air_conditioning')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="air_conditioning">Air Conditioning</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('auto_climate_control')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="auto_climate_control">Auto Climate Control</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('dual_zone')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="dual_zone">Dual Zone</button>\n        </p>\n        <p class="form_cell">\n          &nbsp;\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Entertainment</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('am')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="am">AM Radio</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('fm')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="fm">FM Radio</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('cd')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="cd">CD Player</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="mp3">MP3 Player</button>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Interior</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('leather')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="leather">Leather</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('heated_seats_front')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="heated_seats_front">Heated Seats (Front)</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('heated_seats_rear')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="heated_seats_rear">Heated Seats (Rear)</button>\n        </p>\n        <p class="form_cell">\n          &nbsp;\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Exterior</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('alloy_wheels')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="alloy_wheels">Alloy Wheels</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('roof_rack')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="roof_rack">Roof Rack</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('running_boards')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="running_boards">Running Boards</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('tow_package')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="tow_package">Tow Package</button>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Recent Service</legend>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('recent_brakes')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="recent_brakes">Recent Brakes</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('recent_tires')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="recent_tires">Recent Tires</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('recent_paint')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="recent_paint">Recent Paint</button>\n        </p>\n        <p class="form_cell">\n          <button type="button" class="btn btn-block btn-large';
 if (auto.get('recent_timing_belt')) { 
__p+=' active';
 } 
__p+='" data-toggle="button" data-attr="recent_timing_belt">Recent Timing Belt</button>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Special Features</legend>\n        <p>\n          <textarea id="auto_special_features" class="span3" placeholder="Special features go at the top" style="height:270px" name="automobile[special_features]">'+
((__t=( auto.get('special_features') ))==null?'':__t)+
'</textarea>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Nice-to-Have Features</legend>\n        <p>\n          <textarea id="auto_nice_to_have" class="span3" placeholder="Nice-to-have features go in the middle" style="height:270px" name="automobile[nice_to_have]">'+
((__t=( auto.get('nice_to_have') ))==null?'':__t)+
'</textarea>\n        </p>\n      </fieldset>\n      <fieldset class="span3">\n        <legend>Extra Features</legend>\n        <p>\n          <textarea id="auto_extras" class="span3" placeholder="Extra features go at the bottom" style="height:270px" name="automobile[extras]">'+
((__t=( auto.get('extras') ))==null?'':__t)+
'</textarea>\n        </p>\n      </fieldset>\n    </div>\n    <div class="row">\n      <div class="span12">\n        <p class="clearfix">\n          <input id="auto_form_submit" type="submit" class="btn btn-info" value="';
 if (auto.fresh()) { 
__p+='Add';
 } else { 
__p+='Update';
 } 
__p+='">\n        </p>\n      </div>\n    </div>\n  </form>\n';
}
return __p;
}

BridgeCity.autoListTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <table class="table table-bordered table-hover spaced">\n    <caption>'+
((__t=( caption ))==null?'':__t)+
'</caption>\n    <thead>\n      <tr>\n        <th>Auto</th>\n        <th>Stock Number</th>\n        <th>Color</th>\n        <th>Style</th>\n        <th class="number-column">Price</th>\n        <th class="number-column">Apps</th>\n        <th>Status</th>\n      </tr>\n    </thead>\n    <tbody>\n      '+
((__t=( rows ))==null?'':__t)+
'\n    </tbody>\n  </table>\n';
}
return __p;
}

BridgeCity.autoNewButtonTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <div class="pull-right">\n    <a id="auto_edit_link" rel="router" href="/autos/new"\n      class="btn btn-success btn-medium" style="margin-top:-8px">New</a>\n  </div>\n';
}
return __p;
}

BridgeCity.autoRowTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <td><a href="/autos/'+
((__t=( auto.id))==null?'':__t)+
'">'+
((__t=( auto.get('name') ))==null?'':__t)+
'</a></td>\n  <td>'+
((__t=( auto.get('stock_number') ))==null?'':__t)+
'</td>\n  <td>'+
((__t=( auto.get('color') ))==null?'':__t)+
'</td>\n  <td>'+
((__t=( BridgeCity.toTitleCase(auto.get('style')) ))==null?'':__t)+
'</td>\n  <td class="number-column">'+
((__t=( numeral(auto.get('price')).format('$0,0[.]00') ))==null?'':__t)+
'</td>\n  <td class="number-column">'+
((__t=( auto.get('credit_applications').length ))==null?'':__t)+
'</td>\n  <td>'+
((__t=( BridgeCity.toTitleCase(auto.get('status')) ))==null?'':__t)+
'</td>\n';
}
return __p;
}

BridgeCity.appListTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <table class="table table-bordered table-hover spaced">\n    <caption>'+
((__t=( caption ))==null?'':__t)+
'</caption>\n    <thead>\n      <tr>\n        <th>Auto</th>\n        <th>Stock Number</th>\n        <th>Color</th>\n        <th>Style</th>\n        <th class="number-column">Price</th>\n        <th>Status</th>\n      </tr>\n    </thead>\n    <tbody>\n      ';
 rows 
__p+='\n    </tbody>\n  </table>\n';
}
return __p;
}

BridgeCity.userListTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <table class="table table-bordered table-hover spaced">\n    <caption>'+
((__t=( caption ))==null?'':__t)+
'</caption>\n    <thead>\n      <tr>\n        <th>Name</th>\n        <th>Email address</th>\n        <th>Phone numbers</th>\n        <th>Credit Apps</th>\n        <th class="number-column">Logins</th>\n      </tr>\n    </thead>\n    <tbody>\n      ';
 rows 
__p+='\n    </tbody>\n  </table>\n';
}
return __p;
}

BridgeCity.userRowTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n  <td><a href="/users/'+
((__t=( user.id))==null?'':__t)+
'">'+
((__t=( user.get('name') ))==null?'':__t)+
'</a></td>\n  <td>'+
((__t=( user.get('email_address') ))==null?'':__t)+
'</td>\n  <td>'+
((__t=( phone_numbers ))==null?'':__t)+
'</td>\n  <td>'+
((__t=( credit_applications ))==null?'':__t)+
'</td>\n  <td class="number-column">'+
((__t=( user.get('logins').length ))==null?'':__t)+
'</td>\n';
}
return __p;
}

BridgeCity.creditApplicationTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+='\n    '+
((__t=( BridgeCity.toTitleCase(credit_application.get('status')) ))==null?'':__t)+
' ('+
((__t=( moment(credit_application.created_at).format('LL') ))==null?'':__t)+
')\n';
}
return __p;
}

BridgeCity.phoneNumberTemplate = function(obj){
var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};
with(obj||{}){
__p+=' '+
((__t=( phone_number.phone_type ))==null?'':__t)+
': '+
((__t=( phone_number.phone_number ))==null?'':__t)+
'';
}
return __p;
}