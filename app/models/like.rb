class Like < ApplicationRecord
  belongs_to :review
  belongs_to :user
  # いいね1人一回
  validates_uniqueness_of :review_id, scope: :user_id
end
