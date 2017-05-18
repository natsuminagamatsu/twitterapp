class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    article = @current_user.articles.build(body: params[:article][:body])
    article.save
    redirect_to articles_url
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_url
  end

  def show
    @article = Article.find(params[:id])
  end
end
