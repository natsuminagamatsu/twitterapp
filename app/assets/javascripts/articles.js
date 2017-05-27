document.addEventListener('turbolinks:load', function() {
  $(".heart").on("click", function(e) {
    var element = $(e.target);
    var article_id = element.data("article-id");

    if (element.attr("src") == "/images/red-favorite.png") {
      $.ajax({
        url: "/api/favorites/" + article_id,
        method: "DELETE"
      })
      .done(function() {
        element.attr("src", "/images/gray-favorite.png");
      })
      .fail(function() {
        alert("お気に入り削除に失敗しました");
      });

    } else {
      $.ajax({
        url: "/api/favorites",
        method: "POST",
        data: { article_id: article_id },
      })
      .done(function() {
        element.attr("src", "/images/red-favorite.png");
      })
      .fail(function() {
        alert("お気に入りに失敗しました");
      });
    }
  });
});
