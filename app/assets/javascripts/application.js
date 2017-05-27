// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('turbolinks:load', function() {
  $("#tweet-button").on("click", function(e) {
    var tweet_text = $("#tweet-text").val();
    console.log(tweet_text);
    $.ajax({
      url: "/api/articles",
      method: "POST",
      data: { body: tweet_text },
    })
    .done(function(){
      $("#myModal").modal("hide");

      $("#create-success-alert").show();
      setTimeout(function() {
        $("#create-success-alert").fadeOut();
      }, 1500);

      $("#tweet-text").val("");
    })
    .fail(function(){
      $("#create-failure-alert").show();
      setTimeout(function() {
        $("#create-failure-alert").fadeOut();
      }, 1500);
    });
  });
});
