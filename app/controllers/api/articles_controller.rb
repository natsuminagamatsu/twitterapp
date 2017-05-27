class Api::ArticlesController < ApplicationController
  def create
    article = @current_user.articles.build(body: params[:body])
    article.save!
  end
end
