
$(document).ready(function(){  
  // Celsius to Fahrenheit
  var inputC = $('#inputCelsius');  
  $(inputC).on("change", function() {
    var valueC = parseFloat($(this).val());
    var value_C_to_F = (  (9/5) * valueC + 32 ).toFixed(2);  
      $("#outputFahrenheit").html(value_C_to_F); 
      $("#load_fahrenheit").val(value_C_to_F);  
      $("#load_celsius").val(valueC);  
  });



  // Fahrenheit to Celsius
  var inputF = $('#inputFahrenheit');
  $(inputF).on("change", function() {
    var valueF = parseFloat($(this).val());
    var value_F_to_C = ( (5/9) *(valueF - 32)).toFixed(2); 
      $("#outputCelsius").html(value_F_to_C); 
      $("#load_celsius").val(value_F_to_C); 
      $("#load_fahrenheit").val(valueF);  
  });


    // pounds to kilograms
    $('#inputPounds').change(function() {
      var value = parseFloat($(this).val()) / 2.2046; 
    $("#outputKilograms").html(value); 
    $("#load_kilos").val(value); 
    });
    // kilograms to pounds
    $('#inputKilograms').on("change", function() { 
      var value = parseFloat($(this).val()) * 2.2046;  
    $("#outputPounds").html(value); 
    $("#load_pounds").val(value); 
    });

    //  edit load 
    $('#edit_load_pounds').change(function() {
      var value = parseFloat($(this).val()) / 2.2046; 
    $("#edit_load_kilos").val(value);  
    });
    // kilograms to pounds
    $('#edit_load_kilos').on("change", function() { 
      var value = parseFloat($(this).val()) * 2.2046;  
    $("#edit_load_pounds").val(value); 
    }); 

      // EDIT LOAD Celsius to Fahrenheit
  var inputC = $('#edit_load_celsius');  
  $(inputC).on("change", function() {
    var valueC = parseFloat($(this).val());
    var value_C_to_F = (  (9/5) * valueC + 32 ).toFixed(2);  
      $("#edit_load_fahrenheit").val(value_C_to_F);  
  });
  var inputF = $('#edit_load_fahrenheit');
  $(inputF).on("change", function() {
    var valueF = parseFloat($(this).val());
    var value_F_to_C = ( (5/9) *(valueF - 32)).toFixed(2); 
      $("#edit_load_celsius").val(value_F_to_C);  
 
  });
  

    // reset all kilogram inputs on timer based on value of input
    $("#load_kilos").change(function() { 
      var check = function(){
          setTimeout(check, 200);    
        if ($('#load_kilos').val() == '') {  
          $("#outputPounds").html(''); 
        } else {
              console.log("not empty");
     }
    }
    check();
  });

    // reset all pound inputs on timer based on value of input
      $("#load_pounds").change(function() { 
        var check = function(){
            setTimeout(check, 200);    
          if ($('#load_pounds').val() == '') {  
            $("#outputKilograms").html(''); 
          } else {
                console.log("not empty");
       }
      }
      check();
    });

    $('#load_is_pounds').change(function(){
        if(this.checked) 
        $('#show_hide_is_kilos_check').addClass("hidden");  
        else
        $('#show_hide_is_kilos_check').removeClass("hidden");        
    });

    $('#load_is_kilos').change(function(){
        if(this.checked)  
        $('#show_hide_is_pounds_check').addClass("hidden");
        else
        $('#show_hide_is_pounds_check').removeClass("hidden");       
    });

    $('#load_is_kilos').change(function(){
      if(this.checked)  
      $('#show_me_the_kilograms').removeClass("hidden");
      else
      $('#show_me_the_kilograms').addClass("hidden");       
  });

  $('#load_is_pounds').change(function(){
    if(this.checked)  
    $('#show_me_the_pounds').removeClass("hidden");
    else
    $('#show_me_the_pounds').addClass("hidden");       
});

    $('#load_is_kilos').change(function(){
      if(this.checked) 
      $('#inputPounds').val(""); 
      $('#outputPounds').html("");
      end    
    });

    $('#load_is_pounds').change(function(){ 
      if(this.checked) 
      $('#inputKilograms').val("");
      $('#outputKilograms').html("");
      end    
    });

      $('#inputKilograms').change(function() {
        $('#load_kilos').val($(this).val());
    });
  
      $('#inputPounds').change(function() {
        $('#load_pounds').val($(this).val());
    });



    $('#load_is_kilos').change(function(){
        if(this.checked) 
        $('#show_hide_kilo_input').removeClass("hidden"); 
        else
        $('#show_hide_kilo_input').addClass("hidden");      
    });

    $('#load_is_pounds').change(function(){
        if(this.checked) 
        $('#show_hide_pound_input').removeClass("hidden"); 
        else
        $('#show_hide_pound_input').addClass("hidden");     
    });


    $('#load_is_temp_control').on('change', function() {
        $('#load_is_fahrenheit, #load_is_celsius').not(this).prop('checked', false);   
    });


    $('#load_is_fahrenheit').change(function(){
        if(this.checked) 
        $('#is_celsius_check').addClass("hidden");  
        else
        $('#is_celsius_check').removeClass("hidden");        
    });

    $('#load_is_celsius').change(function(){
        if(this.checked) 
        $('#is_fahrenheit_check').addClass("hidden");  
        else
        $('#is_fahrenheit_check').removeClass("hidden");        
    });

    $('#load_is_temp_control').change(function(){
        if(this.checked) 
        $('#is_fahrenheit_check, #is_celsius_check').removeClass("hidden"); 
        else
        $('#is_fahrenheit_check, #is_celsius_check, #celsius_input, #fahrenheit_input').addClass("hidden");        
    });

    // removes other check box selections
  $('#load_is_pounds, #load_is_kilos').on('change', function() {
    $('#load_is_pounds, #load_is_kilos').not(this).prop('checked', false);  
  });

  // removes other checkbox selections
  $('#load_is_fahrenheit, #load_is_celsius').on('change', function() {
    $('#load_is_fahrenheit, #load_is_celsius').not(this).prop('checked', false);
  });

    $('#load_is_celsius').change(function(){
        if(this.checked) 
        $('#celsius_input').removeClass("hidden");  
        else
        $('#celsius_input').addClass("hidden");          
    });

    $('#load_is_fahrenheit').change(function(){
        if(this.checked) 
        $('#fahrenheit_input').removeClass("hidden");  
        else
        $('#fahrenheit_input').addClass("hidden");         
    });

  // reset celsius inputs on boolean click

  $('#load_is_fahrenheit').change(function(){
    if(this.checked) 
    $('#inputCelsius, #load_celsius').val("");  
    $('#outputCelsius').html("");
    end    
  });

    // reset fahrenheit inputs on boolean click

    $('#load_is_celsius').change(function(){
      if(this.checked) 
      $('#inputFahrenheit, #load_fahrenheit').val("");  
      $('#outputFahrenheit').html("");   
      end    
    });

      // reads #load_celsius value  - used to set converted output of #outputFahrenheit to "" if #load_celsius is blank
    $("#load_celsius").change(function() { 
      var check = function(){
          setTimeout(check, 200);    
        if ($('#load_celsius').val() == '') {  
          $("#outputFahrenheit").html(''); 
        } else {
              console.log("load_celsius not empty");
     }
    }
    check();
  });

      // reads #load_fahrenheit value  - used to set converted output of #outputCelsius to "" if #load_fahrenheit is blank
      $("#load_fahrenheit").change(function() { 
        var check = function(){
            setTimeout(check, 200);    
          if ($('#load_fahrenheit').val() == '') {  
            $("#outputCelsius").html(''); 
          } else {
                console.log("load_fahrenheit not empty");
       }
      }
      check();
    });

// <!--sets :truck_type column as hidden field for record keeping in case truck 
// is removed from system-->
 
   
  $(function() {      
    $("#select-driver").change(function() {  
      $('#all_truck_truck_info').val(this.value);  
      var dropValue = $("#all_truck_truck_info option:selected").text();
      $('#load_equipment_type').val(dropValue); 
    });
  });

  // jQuery(window).on("load", function(){
    
  //     $('#element').change();
    
  //   });

// <!--sets the truck number-->
 
 
// $(document).ready(function(){     
//     $("#select-driver").bind('change', function () { 
  // $("#select-driver").trigger('change'); 
  $(function() {      
    $("#select-driver").change(function() {
      $('#truck_number').val(this.value);  
      var truckNumber = $("#truck_number option:selected").text();
      $('#the_truck_number').html(truckNumber);   
      $('#load_truck_number').val(truckNumber);  
    }); 
    // $("#select-driver").trigger('change');  
  });



// <!--sets the truck year based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_year').val(this.value);  
      var truckYear = $("#truck_year option:selected").text();
      $('#the_truck_year').html(truckYear);  
      $('#load_truck_year').val(truckYear);  
    }); 
  });

 

// <!--sets the truck make based on driver selected-->
 
  
  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_make').val(this.value);  
      var truckMake = $("#truck_make option:selected").text();
      $('#the_truck_make').html(truckMake);  
      $('#load_truck_make').val(truckMake); 
    });
  });



// <!--sets the truck model based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_model').val(this.value);   
      var truckModel = $("#truck_model option:selected").text(); 
      $('#the_truck_model').html(truckModel); 
      $('#load_truck_model').val(truckModel); 
    });
  });



// <!--sets the truck color based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_color').val(this.value);   
      var truckColor = $("#truck_color option:selected").text(); 
      $('#the_truck_color').html(truckColor);    
      $('#load_truck_color').val(truckColor);  
    });
  });





// <!--sets the truck plate based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_plate').val(this.value);   
      var truckPlate = $("#truck_plate option:selected").text();
      $('#the_truck_plate').html(truckPlate);   
      $('#load_truck_plate').val(truckPlate);   
    });
  });


// <!--sets the truck plate state based on driver selected-->
 
  
  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_state').val(this.value);   
      var truckState = $("#truck_state option:selected").text();
      $('#the_truck_state').html(truckState);
      $('#load_truck_state').val(truckState);  
    });
  });



// <!--sets the truck MP based on driver selected-->
 
 
  $(function() {      
    $("#select-driver").change(function() {  
      $('#truck_mpg').val(this.value);   
      var truckState = $("#truck_mpg option:selected").text();
      $('#the_truck_mpg').html(truckState);
      $('#load_truck_mpg').val(truckState);  
    });
  });





// <!--adds warning color to truck info if driver has no truck assigned-->
 //     $("#select-driver").bind('change', function () { 
  // $("#select-driver").trigger('change'); 

  $("#select-driver").bind('change', function () {
    var check = function(){
        setTimeout(check, 200);    
      if ($('#the_truck_make').is(':empty')) { 

              // console.log("Empty"); 
    $('#noTruck').css('background-color', '#ffb3b3'); 
    $( "#noTruckText" ).removeClass( "hidden" );
      $( "#noTruckText" ).show();
      // $("#select-driver").trigger('change');
      } else {
            // console.log("not empty");
          
      $('#noTruck').css('background-color', '#e6ffe6');   
      $( "#noTruckText" ).hide();  
    }
  }
  check();
    });

    $('select[id="select-driver"]').change(function() {
        var str = $('select[id="select-driver"] option:selected').text();
        if (str.length > 15 ) {   
          console.log("length is greater than 15");  
            $('#hideThisStuff').show();   
        } else {
        $('#hideThisStuff').hide();  
        }
    });

 

// END DRIVER TRUCK NEW

// START TRAILER INPUTS


    $(function() {        
      $("#select-driver").change(function() {  
        $('#all_truck_trailer_info').val(this.value);  
        var dropValue = $("#all_truck_trailer_info option:selected").text();
        $('#load_equipment_type').val(dropValue); 
      });
    });



// <!--sets the driver rate per mile based on driver selected in drop down-->

 
  $(function() {     
    $("#select-driver").change(function() {  
      $('#load_driver_user_id').val(this.value); 
      var dropValue = $("#load_driver_user_id option:selected").text();
      $('#load_driver_cents_pm').val(dropValue); 
    });
  });




// <!--sets the trailer number based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_number').val(this.value);  
      var trailerNumber = $("#trailer_number option:selected").text();
      $('#the_trailer_number').html(trailerNumber);     
      $('#load_trailer_number').val(trailerNumber);
    }); 
  });



// <!--sets the trailer year based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_year').val(this.value);  
      var trailerYear = $("#trailer_year option:selected").text();
      $('#the_trailer_year').html(trailerYear);
      $('#load_trailer_year').val(trailerYear); 
    }); 
  });




// <!--sets the trailer make based on driver selected-->
 
   
  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_make').val(this.value);  
      var trailerMake = $("#trailer_make option:selected").text();
      $('#the_trailer_make').html(trailerMake); 
      $('#load_trailer_make').val(trailerMake);  
    });
  });



// <!--sets the trailer type based on driver selected-->
 
 
  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_type').val(this.value);   
      var trailerType = $("#trailer_type option:selected").text();
      $('#the_trailer_type').html(trailerType);
      $('#load_trailer_type').val(trailerType); 
    });
  });



// <!--sets the trailer length based on driver selected-->
 

  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_length').val(this.value);   
      var trailerLength = $("#trailer_length option:selected").text(); 
      $('#the_trailer_length').html(trailerLength);  
      $('#load_trailer_length').val(trailerLength);
    });
  });


// <!--sets the trailer door type based on driver selected-->
 
 
  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_door_type').val(this.value);   
      var trailerDoor = $("#trailer_door_type option:selected").text();  
      $('#the_trailer_door_type').html(trailerDoor);
      $('#load_trailer_door_type').val(trailerDoor);     
    });
  });



// <!--sets the trailer plate based on driver selected-->
 
  
  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_plate').val(this.value);   
      var trailerPlate = $("#trailer_plate option:selected").text();
      $('#the_trailer_plate').html(trailerPlate); 
      $('#load_trailer_plate').val(trailerPlate); 
    });
  });



 
 
  $(function() {      
    $("#select-driver").change(function() {  
      $('#trailer_state').val(this.value);   
      var trailerState = $("#trailer_state option:selected").text();
      $('#the_trailer_state').html(trailerState);
      $('#load_trailer_state').val(trailerState);
    });
  });




// <!--adds warning color to trailer info if driver has no truck assigned-->
 
  $("#select-driver").change(function() { 
  var check = function(){
      setTimeout(check, 200);    
    if( $('#the_trailer_make').is(':empty') ) { 
            // console.log("Empty"); 
  $('#noTrailer').css('background-color', '#ffb3b3'); 
  $( "#noTrailerText" ).removeClass( "hidden" )
    $( "#noTrailerText" ).show();
    } else {
          // console.log("not empty");
        
    $('#noTrailer').css('background-color', '#e6ffe6');  
     $( "#noTrailerText" ).hide(); 
  }
}
check();
  })


// END TRAILER NEW

// SHOW HIDE INPUTS




    $('select[id="select-driver"]').change(function() {
        var str = $('select[id="select-driver"] option:selected').text();
        if (str.indexOf("Company") >= 0) { 
            $('#hideCents, #hideCalculation').fadeIn( "slow" );
        } else {
            $('#hideCents, #hideCalculation').fadeOut( "slow" );  
        }
    });





    $('select[id="select-driver"]').change(function() {
        var str = $('select[id="select-driver"] option:selected').text();
        if (str.indexOf("Owner") >= 0) { 
            $('#showToOwnerOperators').fadeIn( "slow" );
        } else {
            $('#showToOwnerOperators').fadeOut( "slow" );  
        }
    });




// <!--hides destination address when mult addresses is selected-->


  
$('#load_has_multiple_pd').on('click', function(){
    if ( $(this).is(':checked') ) {
        $("#idToHide, #idToHide2, #idToHide3, #hideCalculation").hide("slow");
    } 
    else {
        $("#idToHide, #idToHide2, #idToHide3, #theSubmitButton").show("slow");  
    }
  });




// <!--keeps destination address fields hidden on error as box reloads as checked-->


  if ($('#load_has_multiple_pd').is(':checked')){
      $("#idToHide, #idToHide2, #idToHide3").hide(); 
  }





  
$('#load_has_multiple_pd').on('click', function(){
    if ( $(this).is(':checked') ) {
        $("#theSubmitButton").show();  
    } 

  });



    $("#load_percentage_id").change(function() {
      var percentDeducted = $("#load_percentage_id option:selected").text();   
            var invoicePrice = $("#load_invoice_price").val();   
    $("#load_percent_coverted_to_dollars").val(percentDeducted * invoicePrice); 

    });



  $("#load_invoice_price, #load_booking_fee, #load_percent_coverted_to_dollars").change(function () {
      $("#load_percentage_id").change(function () {
    var loadInvoicePrice = parseFloat($("#load_invoice_price").val());    
    var loadBookingFee = parseFloat($("#load_booking_fee").val());   
    var loadRateAfterPercent = parseFloat($("#load_percent_coverted_to_dollars").val());   
    var total = parseFloat(loadInvoicePrice - loadBookingFee - loadRateAfterPercent);

      $("#load_rate_to_owner_operator").val(total); 
      }).change();
    });




// <!--Hide buttons/show buttons-->


if($('#load_miles').val() == 0 ){$('#calcPL').hide();}  
$('#setVal').on('click' , function() {
     if( this.text != 0){
           $('#theSubmitButton, #calcPL').show("slow");
      }
      else{
           $('#calcPL').hide("slow"); 
     }
});

    
    


    
    


    $("#theSubmitButton").click(function() {    
  var loadMiles = $("#load_miles").val(); 
  var truckAverageMpg = $('#truckAveMpg').val();
  var nationalAverage = $('#load_national_average_diesel_price').val();
  var milesDivTruckAve = (loadMiles / truckAverageMpg);  

  $('#milesDivByAve').val(milesDivTruckAve); 
  $('#totalCost').val(nationalAverage * milesDivTruckAve);    
    $('#load_estimated_diesel_cost').val(nationalAverage * milesDivTruckAve);   
    });


    $('#calcPL').click(function() {    
    var loadInvoicePrice = parseFloat($("#load_invoice_price").val());   
    var loadMiles = $("#load_miles").val(); 
    var truckAverageMpg = $('#truckAveMpg').val();
    var nationalAverage = $('#load_national_average_diesel_price').val();
    var milesDivTruckAve = (loadMiles / truckAverageMpg);  
    var cents2driver = $("#load_driver_cents_pm").val();  
    $('#milesDivByAve').val(milesDivTruckAve); 
    $('#totalCost').val(nationalAverage * milesDivTruckAve);    
    $('#load_estimated_diesel_cost').val(nationalAverage * milesDivTruckAve);  
    var dieselCost = parseFloat(nationalAverage * milesDivTruckAve)
    var ratePTD = parseFloat(loadMiles * cents2driver); 
    var theTotal = parseFloat(loadInvoicePrice - dieselCost - ratePTD);

    $('#profitLoss').val(theTotal);    
    });





    $('#calcPL').click(function() {        
  var loadMiles = $("#load_miles").val();
  var centsToDriver = parseFloat($('#centolasToDriver').val($("#load_driver_cents_pm").val())); 
  var getCentolas = $('#centolasToDriver').val();
  var rateTooDriver =  parseFloat($("#rateToDriver").val(loadMiles * getCentolas));
  
    });

    





    $("#theSubmitButton").click(function() {   
  var loadMiles = $("#load_miles").val(); 

  var milesDivTruckAve = (loadMiles / truckAverageMpg);  

  $('#milesDivByAve').val(milesDivTruckAve); 
  $('#totalCost').val(nationalAverage * milesDivTruckAve);    
    $('#load_estimated_diesel_cost').val(nationalAverage * milesDivTruckAve);   
  });




    $('#calcPL').mouseover(function() {   
      
      var inv = parseFloat($('#invoicePriceParagraph').text($('#load_invoice_price').val()));     
      var dp = parseFloat($("#paymentDriver").text($('#rateToDriver').val())); 
      var diesel = parseFloat($('#fuel').text($('#load_estimated_diesel_cost').val()));  
      var zeTotal = parseFloat($('#totola').text($('#profitLoss').val()));   
    });


// END SHOW HIDE INPUTS




// loads with multiple stops calculations 


  $("#load_kilometers").val($("#kilometers").val());   


  $("#load_miles").val($("#miles").val());   


// shows equipment if a new driver selected during edit load
  $('select[id="select-driver"]').change(function() {
    var str = $('select[id="select-driver"] option:selected').text();
    if (str.length > 1 ) {   
       console.log("Fr8track.io")
        $('#editDriverEquipment').removeClass( "hidden" )   
                    $('#hideDriverEquipment').addClass( "hidden" )   
    } else {
    console.log("Fr8track.io") 
    }
});




}); // documet ready
