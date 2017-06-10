document.addEventListener('turbolinks:load', function() {
  //$("#avator").on("click",function(){
  //}

  $("#text-box").on("mouseup", function() {
    $("#text-box").css('height', '80px');
    $("#button").css('display', 'block');
  });

  $("#articles").on("click", ".heart", function(e) {
    var element = $(e.target);
    var article_id = element.attr("id");

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
