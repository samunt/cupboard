$(function(){
  console.log('cupboard js loaded')
  var color = "none"
  // color all the circles
  $('#cupboard_neutral1_000000').css("background-color", "#FFFFFF", "width", "100px", "height", "100px");
  $('#clr2').css("background-color", "#804002");
  $('#clr3').css("background-color", "#808080");
  $('#clr4').css("background-color", "#000000");
  $('#clr5').css("background-color", "#EADAC1");
  $('#clr6').css("background-color", "#F7EEE5");
  $('#clr7').css("background-color", "#715F39");
  $('#clr8').css("background-color", "#02247D");

  //persist data to back end with ajax on click
  $('#clr1').on('click', function(){
    console.log('color 1 clicked')
    color = "#FFFFFF"
    $.ajax({
      url: $this(),
      method: "POST",
      data: { neutral1: color }
    }).done();
  });


  $("#buttonapi").on('click', function(){
    console.log('button pressed')
    $.ajax ({
      url: "https://api.shop.com:8443/stores/v1/products/874694776?allperms=false",
      method: 'GET',
      dataType: 'json'
    }).done(function(responseData){
      console.log(responseData);
      $('#placeapiresponse').append(responseData);
    }).fail(function(){
      console.log('ajax api request failed')
    });
  });

});
