$(document).ready(function() {
  $.ajax({
    url: 'http://www.goodkarma.tech/charityapi',
    type: 'get',
    dataType: 'json',
    success: function(data) {
      //console.log(data);
      var randomNum = Math.floor(Math.random() * 4);
      $('#name').text(data[randomNum].name);
      //console.log(data[randomNum].name);

      var rawLat = data[randomNum].latitude;
      var rawLong = data[randomNum].longtitude;
      var lat = encodeURI(rawLat);
      var long = encodeURI(rawLong);

      var url = `https://reverse.geocoder.cit.api.here.com/6.2/reversegeocode.json?prox=${lat}${","}${long}&mode=retrieveAddresses&maxresults=1&gen=8&app_id=LIHc6Ti2plzy82gK61JI&app_code=pL2npTL2t7CbcvL3vfeiXg`;

      var xhr = new XMLHttpRequest();
      xhr.open('GET',url,'true');
      xhr.respondType = 'text';
      xhr.send();

      xhr.onload = function() {
         if(xhr.status === 200) {
             var data = JSON.parse(xhr.responseText).Response.View[0].Result[0].Location.Address;
            //  console.log(data);
            //  console.log(data.District);
             $('#address').text(`${data.Label}`);
         }
      }
    }
  });

  //getting jobs for charity.
  $.ajax({
    url: 'http://www.goodkarma.tech/job/3',
    type: 'get',
    dataType: 'json',
    success: function(data) {
      //console.log(data);
      $('#charityName').html('<h2>' + data.name.toUpperCase() + '</h2>');
      $('#description').text("Description: " + data.description);
      $('#hours').text("Hours: " + data.hours);
      $('#amount_workers').text("Worker Required: " + data.amount_workers);
    }
  });

  //getting user.
  $.ajax({
    url: 'http://www.goodkarma.tech/volunteers',
    type: 'get',
    dataType: 'json',
    success: function(data) {
      //console.log(data);
      var randomNum = Math.floor(Math.random() * 3);
      var randUserObj = data[randomNum];
      console.log(randUserObj);
      $('#userName').text(randUserObj.first_name +" "+ randUserObj.last_name);
      $('#note').text("Description: " + randUserObj.note);
      $('#phone').text("Phone: " + randUserObj.phone);
    }
  });
});
