$(document).ready(function() {

  $("#get-form-button").on("submit", function(event){
    event.preventDefault();
    var $addCommentButton = $(this);
    var url = $(this).attr("action");
    console.log(url);
    $.ajax({
      url: url,
      method: "GET"
    }).done(function(renderForm){
      console.log(renderForm)

      $("#question-comments").append(renderForm);
    });
    // $(this).remove();
  });

  // $(document).on("submit", ".new-comment-form", function(event){
  //   var url = $("#question-comment-form").attr('action');
  //   event.preventDefault();
  //   console.log(url);


  // })


});
