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
//= require_tree .

$(document).ready(function(){
  $(".new-post-content-before").click(function(){
    $("#new-post").addClass("hidden");
    //$("#slide-down").removeClass("hidden");
    $("#slide-down").slideDown(1000, function(){

      $("#post-form").removeClass("hidden");

    });
    //$("#slide-down").removeClass("hidden");
  });

  $(".post-buttons").click(function(){
     $("#post-form").addClass("hidden");
    //$("#slide-down").removeClass("hidden");
    $("#slide-down").slideUp(1000, function(){
      $("#new-post").removeClass("hidden");


    });
    //$("#slide-down").removeClass("hidden");
  });

});