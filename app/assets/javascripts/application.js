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
  rendering_timeline();

  $("#search").on("keyup", _.debounce(function() {
    $("#search-result").empty();
    if ($("#search").val() !== "") {
      $.ajax({
        url: "/api/search/show?query=" + $("#search").val(),
        method: "GET",
      })
      .done(function(json) {
        json.forEach(function(article) {
          $("#search-result").append('<li class="list-group-item"><a href="/articles/'+article.id+'">'+article.body+'</a></li>')
        });
      });
    }
  }, 300));

  $("#tweet-button").on("click", function(e) {
    var tweet_text = $("#tweet-text").val();

    $.ajax({
      url: "/api/articles",
      method: "POST",
      data: { body: tweet_text },
    })
    .done(function(){
      clear_timeline();
      rendering_timeline();

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

function clear_timeline() {
  $("#articles").empty();
}

function rendering_timeline() {
  $.getJSON('/api/articles.json', function(json) {
    json.articles.forEach(function(article) { // articles.each do |article| end
      if (article.favorite == true) {
        var image_path = "/images/red-favorite.png";
      } else {
        var image_path = "/images/gray-favorite.png";
      }

      if (article.is_mine) {
        var template_name = "/js/templates/article_mine.html";
      } else {
        var template_name = "/js/templates/article.html";
      }

      var data = {
        "article_id": article.id,
        "date": article.date,
        "image_path": "/uploads/" + article.user_id + ".jpg",
        "profile_path": "/users/" + article.user_id,
        "profile_image_class": "user_" + article.user_id,
        "name": article.name,
        "body": article.body,
        "detail_path": "/articles/" + article.id,
        "favorite_image_path": image_path,
      };

      $("#articles").loadTemplate(template_name, data, {append: true});
    });
  });
}
