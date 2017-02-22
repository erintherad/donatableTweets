$(document).ready(function() {
  // if the user doesn't have a pledge, show the pledge form
  $.ajax({
    type: "GET",
    url: "/pledges",
    success: function(data) {
      console.log(data);
      if(data.length === 0) {
        var pledgeFormTemplate = $('#pledge-form-template').text();
        var templateFunction = _.template(pledgeFormTemplate);
        var html = templateFunction({ dollars_per_tweet: "", max_per_month: ""});
        $('#pledge').html(html);
      } else {
        var pledgeTemplate = $('#pledge-template').text();
        var templateFunction = _.template(pledgeTemplate);

        var pledge = data[0];
        var html = templateFunction(pledge);
        $('#pledge').html(html);
      }
    }
  });

  // when the user submits the pledge form, send it to the api
  $('#pledge').submit(function(e) {
    e.preventDefault();
    var url = "/pledges";

    $.ajax({
       type: "POST",
       url: url,
       data: {
         "dollars_per_tweet": $("#tweet").val(),
         "max_per_month": $("#goal").val()
       },
       success: function(data) {
         // render pledge into template, hide the form
         $('#pledge').empty();
         var pledgeTemplate = $('#pledge-template').text();
         var templateFunction = _.template(pledgeTemplate);

         var html = templateFunction(data);
         $('#pledge').html(html);

       }
     });
  });

  $.ajax({
    type: "GET",
    url: "/tweets",
    success: function(data) {
      var tweeterTemplate = $('#tweeter-template').text();
      var templateFunction = _.template(tweeterTemplate);

      var tweet = data[0];
      var html = templateFunction(tweet);
      $('#tweeter').html(html);
    }
  });
});
