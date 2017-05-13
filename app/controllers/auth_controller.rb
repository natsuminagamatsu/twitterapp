class AuthController < ApplicationController

  before_action :prepare

  def new
    @auth = Auth.new
  end

  def create
    @auth = Auth.new(email: params[:auth][:email])

    user = User.find_by(email: params[:auth][:email])

    if user == nil
      @error_messages.push "Eメールアドレスがありません"
      render "auth/new" # 描画するビューを手動で指定
      return # 処理終了
    end

    unless user.password == params[:auth][:password]
      @error_messages.push "パスワードが違います"
      render "auth/new"
      return # 処理終了
    end

    session[:user_id] = user.id
    redirect_to articles_url
  end

  def destroy
    session.delete :user_id
    redirect_to articles_url
  end

  private

  def prepare
    @error_messages = []
    # エラーメッセージを配列にする
    # ※エラーメッセージが複数ある場合、配列にいれないと表示できない。
  end
end
