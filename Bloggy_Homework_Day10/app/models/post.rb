class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :favoritings
  has_many :users, through: :favoritings
end
