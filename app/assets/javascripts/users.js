$(function(){
  var typeOfClothes = "notChosen"
  console.log('users new page loaded');


  //hide the for... button
  $('.ineedatext2').hide();

  //hide the 2 lists of 'second'
  $('#ineedalist').hide();
  $('#ineedalist2').hide();

  //listen for click of the 2 ineeda buttons and activate list
  $('.ineedatext1').click(function(){
    $('#ineedalist').show();
    $('#ineedalist').css('margin-top', "150px");
  });

  // listen for clicks on types of clothes
  $('#athleisure').click(function(){
    typeOfClothes = "ath";
    console.log('Chose athleisure');
  });

  $('#casual').click(function(){
    typeOfClothes = "cas";
    console.log('Chose Casual');
  });

  $('#professional').click(function(){
    typeOfClothes = "pro";
    console.log('Chose professional');
  });
});
