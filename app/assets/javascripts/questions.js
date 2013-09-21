$(document).ready(function () {
    $( ".vote_down" ).click(function( event ) {
        event.preventDefault();

        var questionId = $(this).attr( "data_question" );
        var answerId = $(this).attr( "id" );
        var data = { answer_id: answerId, like: 'false', question_id: questionId };
            $.get( '/vote', data, function( response ) {
                $('.count-' + response.answer_id).html('LIKES: ' + response.count);
             });
    });

    $( ".vote_up" ).click(function( event ) {
        event.preventDefault();

        var questionId = $(this).attr( "data_question" );
        var answerId = $(this).attr( "id" );
        var data = { answer_id: answerId, like: 'true', question_id: questionId };
            $.get( '/vote', data, function( response ) {
              $('.count-' + response.answer_id).html('LIKES: ' + response.count);
        });
    });

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
        $.post(formUrl, data, function(success){
            $('ul.answers').prepend(success);
        }, "html");
    });
});

