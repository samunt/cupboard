$(function(){
  console.log('main() loaded');

  // hide first and second stage of welcome


  //ajax in new user signup
  // $.ajax({
  //   url: '/users/new',
  //   dataType: 'html'
  // }).done(function(responseData){
  //   $('#signup').html(responseData);
  // });


  //listen for button click
  $('#main-button').click(function(){
    console.log('clicked');
    $.ajax({
      url: '/users/new',
      dataType: 'html'
    }).done(function(responseData){
      $('#signup').html(responseData);
    });

  });




});
