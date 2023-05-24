class PostForm
  include ActiveModel::Model

  attr_accessor(
    :title, :text, :address, :image, 
    :category_id, :budget_id, :opening_hour_id, 
    :id, :created_at, :updated_at,
    :user_id, :tag_name
  ) 

  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :text, length: { maximum: 2000 }
    validates :address, length: { maximum: 200 }
    validates :image
    validates :category_id, :budget_id, :opening_hour_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    post = Post.create(title: title, text: text, address: address, image: image, category_id: category_id, budget_id: budget_id, opening_hour_id: opening_hour_id, user_id: user_id)
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