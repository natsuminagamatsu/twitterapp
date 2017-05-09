class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.new(body: params[:article][:body]).save
    #redirect_to action: "index"
    #redirect_to :action => "index"
    redirect_to articles_url
  end

  def destroy
    Article.find(params[:id]).delete
    redirect_to articles_url
  end

  def show
    @article = Article.find(params[:id])
  end
end
