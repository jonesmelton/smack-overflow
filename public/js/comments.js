$(document).ready(function() {
  $(".question-comment-button").on("click", function(event){
    event.preventDefault();
    var $addCommentButton = $(this);
    var url = $(this).attr("href");
    $.ajax({
      url: url,
    }).done(function(renderForm){
      console.log(renderForm)
      $("#question-comments").append(renderForm);

    });
    // $(this).remove();
  });

});
