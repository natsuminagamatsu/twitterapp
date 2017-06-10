class Api::ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def create
    article = @current_user.articles.build(body: params[:body])
    article.save!
  end
end
