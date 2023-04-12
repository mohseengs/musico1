$('.follow_button').click(function() {
    var button = $(this);
    var url = button.children('#url').val();
    var method = button.children('#method').val();
    $.ajax({
        url: url+".js",
        method: method ,
    });
});