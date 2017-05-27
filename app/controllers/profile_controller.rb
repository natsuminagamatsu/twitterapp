class ProfileController < ApplicationController
  def update
    @current_user.update_attributes(user_params)

    if params[:user].has_key? :pictures
      save_photo params[:user][:pictures]
      @current_user.update_attribute(:has_photo, true)
    end

    redirect_to profile_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :place, :weburl, :bio)
  end

  # ファイルへのパスを作る
  def photo_path
    Rails.root.join('public', 'uploads', photo_filename)
  end

  # ファイル名を作る
  def photo_filename
    "#{@current_user.id}.jpg"
  end

  # 保存する関数
  def save_photo(uploaded_file)
    File.open(photo_path, 'wb') do |file|
     file.write(uploaded_file.read)
    end
  end
end
