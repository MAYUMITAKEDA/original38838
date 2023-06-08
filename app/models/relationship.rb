class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  with_options presence: true do
    validates :follower_id, presence: { message: 'must exist' }
    validates :following_id, presence: { message: 'must exist' }
  end
end
