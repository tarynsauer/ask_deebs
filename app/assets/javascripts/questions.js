$(document).ready(function(){
  $('h3.ask-question').on("click", function(event){
    event.preventDefault();
    $.get("/questions/new", function(data) {
      $('h3.ask-question').hide();
      $('form.search').before(data);
    });
  });
});
