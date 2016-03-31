$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $(".container").on("click", ".vote-button > input", function(event) {
    event.preventDefault();

    var that = $(this)
    var link = $(this).parent().attr("action");
    console.log(link);
    var value = $(this).attr("value");
    console.log(value);

    return_hash = {
      "vote_type":value
    }
    // console.log(request);

    var req = $.ajax({
      url: link,
      method: "POST",
      data: return_hash
    });

    req.done(function(response) {
      console.log(response);
      test = $(that).parent();
      test.find(".score").text(response.score);

    });
  });

});
