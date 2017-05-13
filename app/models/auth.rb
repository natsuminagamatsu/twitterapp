class Auth
  include ActiveModel::Model

  # Formで使用するプロパティを定義する
  attr_accessor :email, :password
end
