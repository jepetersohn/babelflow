$(document).ready(function() {
  // handleLoggingOut();
});

// function handleLoggingOut() {
//   $('.logout').on('click', function(event) {
//   event.preventDefault();
//  var logoutUrl = $(this).attr('action');
//   var request = $.ajax({
//     method: "DELETE",
//     url: logoutUrl
//   })
//   request.done(function() {
//     $(".logged_in_nav").remove();
//     $(".not_logged_in_nav").add();
    //also tried show/hide. same results.
    //also need to account for what to do about logging out on a page other than the main page...like, hiding the comment/answer buttons etc
  })
 });
};
