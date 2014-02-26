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
    $("#slide-down").slideDown(1000, function(){
      $("#post-form").removeClass("hidden");
    });
  });


  $(".post-buttons").click(function(){
    $("#post-form").addClass("hidden");
    $("#slide-down").slideUp(1000, function(){
      $("#new-post").removeClass("hidden");
    });
  });

  $(".posts").on("click", ".edit-post-toggle-btn", function(event){
    $settingsButton = $(event.currentTarget)
    $settingsButton.next().removeClass("hidden");
  });

  // $(".edit-post-toggle-btn").click(function(event){
//     $settingsButton = $(event.currentTarget)
//     $settingsButton.next().removeClass("hidden");
//
//   })

  $(".posts").on("click", ".edit-option", function(event){
    $editdiv= $(event.currentTarget);

    $editdiv.parent().parent().addClass("hidden");
    $editdiv.parent().parent().parent().next().slideDown(1000, function(){

    });
  })
  // $(".edit-option").click(function(event){
//     $editdiv= $(event.currentTarget);
//
//     $editdiv.parent().parent().addClass("hidden");
//     $editdiv.parent().parent().parent().next().slideDown(1000, function(){
//
//     });
//
//   });

   $(".edit-post-buttons").click(function(event){
     $target = $(event.currentTarget);
     console.log($target.parent().parent().parent().find('div'));
     $target.parents(".edit-post-form-container").slideUp(1000, function(){
     });

   });

   $("#post-form").on("ajax:success", function(event, data){
     console.log(data);
     $(data).insertAfter(".create-new-post");
     this.reset();

   });
});