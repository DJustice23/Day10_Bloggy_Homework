class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :fav_posts, through: :favoritings, source: :post
  has_many :favoritings
  has_many :authored_posts, class_name: Post

  def has_favorited?(post)
    Favoriting.find_by(user_id: id, post_id: post.id) != nil
  end
end
