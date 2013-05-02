// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require json2
//= require numeral
//= require moment
//= require backbone
//= require backbone-relational
//= require bootstrap-button
//= require jquery.noty
//= require_tree ./layouts
//= require_tree ./themes
//= require ./app/app
//= require_self

// Typekit
(function() {
  var config = {
    kitId: 'xos6osp',
    scriptTimeout: 3000
  };
  var h=document.getElementsByTagName("html")[0];h.className+=" wf-loading";var t=setTimeout(function(){h.className=h.className.replace(/(\s|^)wf-loading(\s|$)/g," ");h.className+=" wf-inactive"},config.scriptTimeout);var tk=document.createElement("script"),d=false;tk.src='//use.typekit.net/'+config.kitId+'.js';tk.type="text/javascript";tk.async="true";tk.onload=tk.onreadystatechange=function(){var a=this.readyState;if(d||a&&a!="complete"&&a!="loaded")return;d=true;clearTimeout(t);try{Typekit.load(config)}catch(b){}};var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(tk,s)
})();

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