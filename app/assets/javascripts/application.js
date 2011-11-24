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

$('#city_city_id').selectmenu({style:'dropdown', menuWidth:'300'});
$('.search-button').click(function(e){
if ($('#search_item_name_contains').val()=='')
    e.preventDefault();
  }); 

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
 $('input#deal_reg_price').removeAttr("disabled");	

$("#deal_percent_off").click(function(){
	$('#deal_percent_off').removeAttr("disabled");
 	$('input#deal_n_item_free').attr("disabled","disabled");
  $('input#deal_reg_price').attr("disabled","disabled");
 });
   
$("#deal_n_item_free").click(function(){
$('#deal_n_item_free').removeAttr("disabled");
$('input#deal_percent_off').attr("disabled","disabled");
$('input#deal_reg_price').attr("disabled","disabled");
 });

$('#size').click(function(e){e.preventDefault();
    $('.size-instruction').dialog({
         autoOpen:false,
         width:300,
         height:100,
         position:'center'
  });
  $('.size-instruction').dialog('open');
});

$('#actual').click(function(e){e.preventDefault();
    $('.actual-instruction').dialog({
         autoOpen:false,
         width:300,
         height:100,
         position:'center'
  });
  $('.actual-instruction').dialog('open');
});

$('#free-or').click(function(e){e.preventDefault();
    $('.not-fixed-instruction').dialog({
         autoOpen:false,
         width:300,
         height:100,
         position:'center'
  });
  $('.not-fixed-instruction').dialog('open');
});

$('#off').click(function(e){e.preventDefault();
    $('.percent-off').dialog({
         autoOpen:false,
         width:300,
         height:100,
         position:'center'
  });
  $('.percent-off').dialog('open');
});

$('#free').click(function(e){e.preventDefault();
    $('.free-item').dialog({
         autoOpen:false,
         width:300,
         height:100,
         position:'center'
  });
  $('.free-item').dialog('open');
});

$('#street').click(function(e){e.preventDefault();
    $('.street-instruction').dialog({
         autoOpen:false,
         width:300,
         height:100,
         position:'center'
  });
  $('.street-instruction').dialog('open');
});

$('.note').live('click',function(){$(this).hide();});
$('.error').live('click',function(){$(this).hide();});

});