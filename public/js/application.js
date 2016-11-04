$(document).ready(function() {
  handleQuestionVote();
});


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