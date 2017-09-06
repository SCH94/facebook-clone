class Post < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  has_many :likes
  
  has_many :comments
  
end
