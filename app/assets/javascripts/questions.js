$(document).ready(function () {
    $( ".vote_down" ).click(function( event ) {
        var questionId = $(this).attr( "data-question" );
        var answerId = $(this).attr( "id" );
        var url = '/vote_down';
        var data = { answer_id: answerId, like: false, question_id: questionId};
            console.log(data);
            $.post( url, data, function( response ) {
              console.log(response);
              // $(this).( ".count" ).html( data );
            });


    });
});

        // <span class="vote_up" data-question=<%="#{@question.id}"%> id=<%="#{answer.id}"%>>Vote Up</span>
        // <span class="vote_down" data-question=<%="#{@question.id}"%> id=<%="#{answer.id}"%>>Vote Down</span>