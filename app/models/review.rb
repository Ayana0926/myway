class Review < ApplicationRecord
  #reviewsテーブルから中間テーブルに対する関連付け
  belongs_to :user, optional: true
  has_many :review_tag_relations, dependent: :destroy
  #reviewsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :review_tag_relations, dependent: :destroy

  mount_uploader :image, ImageUploader
    
# いいね機能および削除時の対応
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
