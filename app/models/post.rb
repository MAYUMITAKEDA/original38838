class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :opening_hour
  belongs_to :area
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end