class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
     User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password]).save
     session[:user_id] = User.where(email: params[:user][:email]).first.id

     redirect_to articles_url
  end

  def show
    @user = User.find(params[:id])
  end
end
