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

  //start new post
  $("body").on("click", "#new-post", function(event){
    getEditorDiv();
    $("body").addClass("has-active-modal");
    $("#new-post").addClass("hidden");
    $("#new-post").removeClass("display-inline-block")
    $("#slide-down").slideDown(700, function(){
      $("#slide-down").addClass("display-inline-block")
      $("#post-form").removeClass("hidden");
    });
  });

  //finish or cancel new post
  $(".post-buttons").click(function(){
    $("#hidden-post-area").val(postarea.innerHTML);
    $("#post-form").addClass("hidden");
    $("#slide-down").slideUp(700, function(){
      $("#new-post").removeClass("hidden");
      $("body").removeClass("has-active-modal");
    });
  });

  //gear button
  $(".posts").on("click", ".edit-post-toggle-btn", function(event){
    $settingsButton = $(event.currentTarget)
    $settingsButton.next().show();
    event.stopPropagation();
  });

  $(document).click(function(){
    $(".edit-options").hide();
  })

  //start edit
  $(".posts").on("click", ".edit-option", function(event){
    $target= $(event.currentTarget);
    $greybar = $target.parents(".grey-bar");
    getEditorDiv2($greybar.next().find(".edit-post-area"));
    console.log("should be div");
    console.log($greybar.next().find(".edit-post-area"));
    $("body").addClass("has-active-modal");

    $greybar.prev().addClass("hidden");

    $greybar.next().slideDown(700, function(){
      console.log($(".hidden-post-edit-area").val());
      editpostarea.html($greybar.next().find(".hidden-post-edit-area").val());
      console.log($greybar.next().find(".hidden-post-edit-area").val());
    });
  })


  //finish/cancel edit
  $(".posts").on("click", ".edit-post-buttons", function(event){

     $target = $(event.currentTarget);
     $target.siblings(".hidden-post-edit-area").val(editpostarea.html());
     console.log(editpostarea.html());
     $target.parents(".edit-post-form-container").slideUp(700, function(){

       $target.parents(".edit-post-form-container").prev().prev().removeClass("hidden");
       $("body").removeClass("has-active-modal");
     });
   });

   //UJS to add new post
   $("#post-form").on("ajax:success", function(event, data){
     console.log(data);
     $(data).insertAfter(".post:first-child");
     this.reset();
   });


});


var postarea;

function getEditorDiv() {
  postarea = document.getElementById("postarea");

}

function add(command, value) {
  document.execCommand(command, false, value);
  postarea.focus();
  console.log(postarea.innerHTML);
}

var editpostarea;

function getEditorDiv2(div){
  editpostarea = div;

}

function edit(command, value) {
  document.execCommand(command, false, value);
  editpostarea.focus();
}


