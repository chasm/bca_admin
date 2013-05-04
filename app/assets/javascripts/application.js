//= require jquery
//= require bootstrap-button
//= require ./vendor/json2
//= require ./vendor/numeral
//= require ./vendor/moment
//= require ./vendor/jquery.noty
//= require ./vendor/underscore
//= require ./vendor/backbone
//= require ./vendor/marionette
//= require ./vendor/relational
//= require_tree ./vendor/layouts
//= require_tree ./vendor/themes
//= require_self

// Typekit
// (function() {
//   var config = {
//     kitId: 'xos6osp',
//     scriptTimeout: 3000
//   };
//   var h=document.getElementsByTagName("html")[0];h.className+=" wf-loading";var t=setTimeout(function(){h.className=h.className.replace(/(\s|^)wf-loading(\s|$)/g," ");h.className+=" wf-inactive"},config.scriptTimeout);var tk=document.createElement("script"),d=false;tk.src='//use.typekit.net/'+config.kitId+'.js';tk.type="text/javascript";tk.async="true";tk.onload=tk.onreadystatechange=function(){var a=this.readyState;if(d||a&&a!="complete"&&a!="loaded")return;d=true;clearTimeout(t);try{Typekit.load(config)}catch(b){}};var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(tk,s)
// })();

$(function(){
  $.noty.defaults.layout = 'bottomRight';
  
  var update_status = function(e){
    console.log("running update_status");
    $.ajax({
      url: '/admin/automobiles/' + $(this)[0].name,
      method: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify({status: $(this).val()}),
      dataType: 'html',
      success: function(data) {
        $('#main_page').html(data);
        $('.status-selector').on('change', update_status);
      }
    });
  };
  
  $('.status-selector').on('change', update_status);
});