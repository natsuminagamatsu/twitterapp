class Api::FavoritesController < ApplicationController
  def create
    fav = @current_user.favorites.build(article_id: params[:article_id])
    fav.save
  end

  def destroy
    @current_user.favorites.where(article_id: params[:id]).each do |favorite|
      favorite.destroy
    end
  end
end
