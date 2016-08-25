$(function(){
  console.log('cupboard js loaded')
  var color = "none"
  // color all the circles
  $('#clr1').css("background-color", "#FFFFFF");
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
    $.ajax{
      url: "/users/:id/cupboards/:id/update",
      method: "POST",
      data: { color }
    }
  });
});
