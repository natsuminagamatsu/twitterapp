class CommentsController < ApplicationController
  def new
    unless session.has_key? :user_id
      redirect_to new_user_url
      return
    end

    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @current_user.comments.build(body: params[:comment][:body], article_id: params[:article_id]).save
    redirect_to article_url(params[:article_id])
  end

  def destroy
    @article = Article.find(params[:article_id])
    Comment.find(params[:id]).delete
    redirect_to(params[:article_id])
  end
end
