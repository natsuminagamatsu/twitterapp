class ProfileController < ApplicationController
  def update
    @current_user.update_attributes(user_params)
    redirect_to users_url
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :birthday, :place, :weburl, :bio)
  end
end
