$(document).ready(function(){
    $('a.editAnswer').on("click", function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        var answerId = $(this).attr('id');
        answerId = answerId.slice(12);
        var replace = $('#answer_'+answerId)

          $.get(url, function(success){
              $(replace).replaceWith(success);

        }, "html");
    });
});
