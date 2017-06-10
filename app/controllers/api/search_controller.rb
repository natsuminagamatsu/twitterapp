class Api::SearchController < ApplicationController
  def show
    render json: Article.where("body LIKE ?", "%#{params[:query]}%")
  end
end
