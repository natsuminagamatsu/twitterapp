class FavoritesController < ApplicationController
  def create
    fav = @current_user.favorites.build(article_id: params[:article_id])
    fav.save
    redirect_to articles_url
  end
end
