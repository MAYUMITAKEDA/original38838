class PostForm
  include ActiveModel::Model

  attr_accessor(
    :title, :text, :address, :image, 
    :category_id, :budget_id, :opening_hour_id, 
    :id, :created_at, :updated_at,
    :user_id
  ) 

  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :text, length: { maximum: 2000 }
    validates :address, length: { maximum: 200 }
    validates :image
    validates :category_id, :budget_id, :opening_hour_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    Post.create(title: title, text: text, address: address, image: image, category_id: category_id, budget_id: budget_id, opening_hour_id: opening_hour_id, user_id: user_id)
  end

  def update(params, post)
    post.update(params)
  end
  
  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}")
    else
      Post.all
    end
  end
end