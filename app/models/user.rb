class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         #:recoverable, 
         
  has_many :spots, dependent: :destroy
  
  has_many :relationships, dependent: :destroy, foreign_key: :follower_id
  has_many :following_users, through: :relationships, source: :followed
  has_many :reverse_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :follower_users, through: :reverse_relationships, source: :follower
  
  def follow(user)
    self.relationships.find_or_create_by(followed_id: user.id)
  end
  
  def unfollow(user)
    self.relationships.find_by(followed_id: user.id)&.destroy
  end
  
  def following?(user)
    self.following_users.include?(user)
  end
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_spots, through: :favorites, source: :spot
  
  def favorite(spot)
    self.favorites.find_or_create_by(spot_id: spot.id)
  end
  
  def unfavorite(spot)
    self.favorites.find_by(spot_id: spot.id)&.destroy
  end
  
  def favorite?(spot)
    self.favorite_spots.include?(spot)
  end
end
