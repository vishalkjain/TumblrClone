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
  //$(".new-post-content-before").click(function(){
    getEditorDiv();
    $("body").addClass("has-active-modal");
    $("#new-post").addClass("hidden");
    $("#new-post").removeClass("display-inline-block")
    $("#slide-down").slideDown(800, function(){
      $("#slide-down").addClass("display-inline-block")

      $("#post-form").removeClass("hidden");
    });
  });

  //finish or cancel new post
  $(".post-buttons").click(function(){
    $("#hidden-post-area").val(postarea.innerHTML);
    // $("#post-form")[0].reset();
//     $("#postarea").html("");
    $("#post-form").addClass("hidden");
    $("#slide-down").slideUp(1000, function(){
      $("#new-post").removeClass("hidden");
      $("body").removeClass("has-active-modal");
    });
  });

  //gear button stuff
  $(".posts").on("click", ".edit-post-toggle-btn", function(event){
    $settingsButton = $(event.currentTarget)
    $settingsButton.next().show();
    event.stopPropagation();
  });

  $(document).click(function(){
    $(".edit-options").hide();
  })



  // $(".edit-post-toggle-btn").click(function(event){
//     $settingsButton = $(event.currentTarget)
//     $settingsButton.next().removeClass("hidden");
//
//   })

  //start edit
  $(".posts").on("click", ".edit-option", function(event){
    $editdiv= $(event.currentTarget);
    $("body").addClass("has-active-modal");

    //<ul class="post-content display-inline-block">
    //console.log($editdiv.parent().parent().parent().prev());
    //$editdiv.parent().parent().parent().prev().hide();
    $editdiv.parent().parent().parent().prev().addClass("hidden");
    //<div class="edit-post-form-container post-content post-form hidden">
    //console.log($editdiv.parent().parent().parent().next());
    $editdiv.parent().parent().parent().next().slideDown(1000, function(){

      // $editdiv.closest(".post-info").hide();
    });
  })


  //finish/cancel edit
   $(".edit-post-buttons").click(function(event){
     $target = $(event.currentTarget);
     //show <ul class="post-content display-inline-block">
     $target.parents(".edit-post-form-container").slideUp(1000, function(){

       console.log($target.parent().parent().prev().prev());
       //hits li.post for early posts, ul.post-content for later ones
       //$target.parent().parent().prev().prev().show();
       $target.parent().parent().prev().prev().removeClass("hidden");
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

function edit(command, value) {
  document.execCommand(command, false, value);
  postarea.focus();
  console.log(postarea.innerHTML);
}




