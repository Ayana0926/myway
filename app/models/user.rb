class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # いいね機能および削除時の対応       
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review
  # マイページ登録
  validates :name, presence: true #名前必須
  validates :profile, length: { maximum: 200 } #プロフィール２００文字以内
  # 周りに見えるようにいいね判定
  def already_liked?(review)
    self.likes.exists?(review_id: review.id)
  end
end
