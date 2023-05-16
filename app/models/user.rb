class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name:"Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  with_options presence: true do
    validates :nickname
    validates :profile, length: { maximum: 150 }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }, on: :create

  def followed_by?(user)
    follower = passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end
end
