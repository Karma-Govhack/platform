$(document).ready(function() {

  function getLocation(latt, longg, callback) {
    var lat = encodeURI(latt);
    var long = encodeURI(longg);
    var res;

    $.ajax({
      url: `https://reverse.geocoder.cit.api.here.com/6.2/reversegeocode.json?prox=${lat}${","}${long}&mode=retrieveAddresses&maxresults=1&gen=8&app_id=LIHc6Ti2plzy82gK61JI&app_code=pL2npTL2t7CbcvL3vfeiXg`,
      type: 'get',
      dataType: 'json',
      success: function(data) {
        //console.log(data.Response.View[0].Result[0].Location.Address);
        callback(data.Response.View[0].Result[0].Location.Address);
      }
    });
  }
    /*var url = `https://reverse.geocoder.cit.api.here.com/6.2/reversegeocode.json?prox=${lat}${","}${long}&mode=retrieveAddresses&maxresults=1&gen=8&app_id=LIHc6Ti2plzy82gK61JI&app_code=pL2npTL2t7CbcvL3vfeiXg`;
    var xhr = new XMLHttpRequest();
    xhr.open('GET',url,'true');
    xhr.respondType = 'text';
    xhr.send();

     if(true) {
         //var data = JSON.parse(xhr.responseText);//.Response.View[0].Result[0].Location.Address;
         console.log(xhr.responseText);
        //  console.log(data);
        //  console.log(data.District);
         //$('#address').text(`${data.Label}`);
         //result = data;
         //console.log(result);
         //return data;
     }
    return result;*/

  $.ajax({
    url: 'http://www.goodkarma.tech/volunteers',
    type: 'get',
    dataType: 'json',
    success: function(data) {
      //console.log(data);
      var randomNum = Math.floor(Math.random() * 4);
      var randObj = data[randomNum];
      //console.log(randObj);

      var userId = randObj.id;

      for (var i = 0; i < 5; i++) {
        var skill = randObj.skills[i].name;
        $('#skill').append('<li>' + skill + '</li>');
      }

      $('#userName').text(randObj.first_name + " " + randObj.last_name);
      $('#userHours').text(randObj.hours + " Hours");
      $('#aboutMe').text(randObj.note);

      var rawLat = randObj.latitude;
      var rawLong = randObj.longtitude;

      //getting location.
      getLocation(rawLat,rawLong, function(re){
        //console.log(re);
        $('#address').text(`${re.Label}`);
      });

      //job obj for specific user.
      $.ajax({
        url: 'http://www.goodkarma.tech/job?user_id=' + userId,
        type: 'get',
        dataType: 'json',
        success: function(data) {
          //console.log(data.length);
          //var randJobObjIndex = Math.floor(Math.random() * data.length);

          console.log(data[0]);

          $('#name').text("Name: "+data[0].name);
          $('#description').text("Description: "+data[0].description);
          $('#hours').text("Hours: "+data[0].hours);
          $('#amount_workers').text("Workers Required: "+data[0].amount_workers);
          getLocation(data[0].latitude,data[0].longtitude, function(re){
            //console.log(re);
            $('#job_address').text("Address: " + `${re.Label}`);
          });
        }
      });
    }
  });

});
