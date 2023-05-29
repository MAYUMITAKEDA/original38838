class PostForm
  include ActiveModel::Model

  attr_accessor(
    :title, :text, :address, :images, 
    :category_id, :budget, :opening_hour_id, 
    :id, :created_at, :updated_at,
    :user_id, :tag_name, :area_id
  ) 

  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :text, length: { maximum: 2000 }
    validates :address, length: { maximum: 200 }
    validates :images
    validates :budget, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
    validates :category_id, :opening_hour_id, :area_id, presence: { message: "can't be blank" }
  end
  validates :category_id, :opening_hour_id, :area_id, numericality: { only_integer: true }, allow_blank: true
  validates :images, length: { minimum: 1, maximum: 5, message: " must be one or no more than five"}

  def save
    post = Post.create(title: title, text: text, address: address, images: images, category_id: category_id, budget: budget, opening_hour_id: opening_hour_id, user_id: user_id, area_id: area_id)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
    end
  end

  def update(params, post)
    post.post_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    post.update(params)
    PostTagRelation.create(post_id: post.id, tag_id: tag.id) if tag_name.present?
  end
end