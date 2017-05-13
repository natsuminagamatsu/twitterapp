class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :user
end
