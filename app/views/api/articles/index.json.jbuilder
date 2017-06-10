json.articles @articles do |article|
  json.id article.id
  json.date article.created_at.to_s(:published_on)
  json.body article.body
  json.name article.user.name
  json.user_id article.user.id

  if article.user_id == @current_user.id
    json.is_mine true
  else
    json.is_mine false
  end

  if @current_user.favorites.where(article_id: article.id).size >= 1
    json.favorite true
  else
    json.favorite false
  end
end
