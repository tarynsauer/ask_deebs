$(document).ready(function(){
  $('h3.ask-question').on("click", function(event){
    event.preventDefault();
    $.get("/questions/new", function(data) {
      $('h3.ask-question').hide();
      $('form.search').before(data);
    });
  });

  $('form#new_answer').submit(function(event){
    event.preventDefault();
    formContent = $('textarea#answer_content').val();
    data = { answer : { content : formContent } }
    formUrl = $('form#new_answer').attr('action');
    $.post(formUrl, data, function(response){
      $('ul.answers').append(response);
    });
  });
});
