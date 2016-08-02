$(function(){
  console.log('main() loaded');

  $('#main-button').on('click', function(e){
    e.preventDefault();

    $.ajax("/users/new").done(function(responseData) {
      $("#new-user").html(responseData);
    }).fail(function() {
      console.log('Something bad happened. Not sure what.')
    });
  });
});
