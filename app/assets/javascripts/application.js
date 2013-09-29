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
//= require jquery.ui.all
//= require dynatree/jquery.dynatree
//= require_tree .


// application_jquery.js
function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}

jQuery(function(){
  jQuery("#tabs").tabs();
});

function check_search_form(){
  if(document.forms[0]['search_key'].selectedIndex == 1 && 
     document.forms[1]["conditions[sc]"].selectedIndex == 0){
    alert('please select Service Name');
    return false;
  }
  if(document.forms[0]['search_key'].selectedIndex == 2 && 
     document.forms[1]["conditions[sv]"].selectedIndex == 0){
    alert('please select Server Name');
    return false;
  }
  return true;
}
