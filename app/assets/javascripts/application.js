// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr, settings) {
    xhr.setRequestHeader("Accept", "application/json");
    settings['dataType'] = "json";
    settings['contentType'] = "application/json";
  }
});
$(document).ready(function() {
$(".man").click(function(){alert('great')});

$('#city_city_id').selectmenu({style:'dropdown', menuWidth:'250'});

$("input.fixed-price").click(function(){
  $("tr.fixed").toggleClass("ui-helper-hidden");
  $("tr.percent").addClass("ui-helper-hidden");	
});

$("input.percent-off").click(function(){
  $("tr.percent").toggleClass("ui-helper-hidden");
   $("tr.fixed").addClass("ui-helper-hidden");	
});

$('#deal_percent_off').removeAttr("disabled");
$('#deal_n_item_free').removeAttr("disabled");		

$("#deal_percent_off").click(function(){
	$('#deal_percent_off').removeAttr("disabled");
 	$('input#deal_n_item_free').attr("disabled","disabled");
 });
   
$("#deal_n_item_free").click(function(){
$('#deal_n_item_free').removeAttr("disabled");
$('input#deal_percent_off').attr("disabled","disabled");
 });


});