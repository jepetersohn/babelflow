$(document).ready(function() {
  addQuestionHandler();
  handleQuestionVote();
  // handleLoggingOut();
  addCommentToQuestions();
  // addCommentToAnswers();
});


var addQuestionHandler = function() {
  $("#question-post-form").on("submit", function(event) {
    event.preventDefault();
    var form = $("#question-post-form");
    var listToAppend = $("#question-list");
    var data = form.serializeArray();
    $.ajax({
      url: '/questions',
      type: 'POST',
      data: data
    })
    .done(function(response) {
      listToAppend.append(response);
    })
    .fail(function() {
      alert("Post failed. Did you supply a title and body?");
    });
  });
};

function handleQuestionVote(){
  $('.vote').on("submit", function(event) {
    event.preventDefault();
    var url = $(this).attr('action');
    var vote_value = $(this).children('button').attr('value');
    var $form = $(this)
    $.ajax({
      url: url,
      type: "POST",
      data: {vote: vote_value}
    })
    .done(function(response) {
      var new_value = 'Vote score:' + ' ' + response
      $form.closest('.question-votes').children('#score').text(new_value);
    });
  });
};

  // handleLoggingOut();


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
//   })
//  });
// };

var addCommentToQuestions = function() {
  $("form#Question.new-comment-form").on("submit", function(event) {
    event.preventDefault();
    var form = $("form#Question.new-comment-form");
    var listToAppend = $("#question-comment-list");
    var data = form.serializeArray();
    $.ajax({
      url: '/comments',
      type: 'POST',
      data: data
    })
    .done(function(response) {
      console.log(response);
      listToAppend.append(response);
    })
    .fail(function() {
      alert("Comment failed. Did you enter in a blank value?");
    });
  });
};

// var addCommentToAnswers = function() {
//   $("#new-comment-form").on("click", function(event) {
//     event.preventDefault();
//     var form = $("#new-comment-form");
//     var listToAppend = $("#answer-comment-list");
//     var data = form.serializeArray();
//     $.ajax({
//       url: '/comments',
//       type: 'POST',
//       data: data
//     })
//     .done(function(response) {
//       listToAppend.append(response);
//     })
//     .fail(function() {
//       alert("Comment failed. Why the hell did you try to enter a blank value?");
//     });

//   });
// };
