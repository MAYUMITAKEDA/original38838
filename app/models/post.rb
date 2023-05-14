class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :budget
  belongs_to :opening_hour
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :text, length: { maximum: 2000 }
    validates :address, length: { maximum: 200 }
    validates :image
    validates :category_id, :budget_id, :opening_hour_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}")
    else
      Post.all
    end
  end
end