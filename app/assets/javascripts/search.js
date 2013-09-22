var liveSearch = function() {
    $("#search").bind("keyup", function() {
        var url = $("#search_form").attr("action")
        var data = $("#search_form").serialize();

        $.get(url, data, function(response){
            $("#live-search").html(response);
        });
    });
};

$(document).ready(liveSearch);
$(document).on('page:load', liveSearch);

