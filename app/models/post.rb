class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :budget
  belongs_to :opening_hour
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end