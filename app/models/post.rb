class Post < ApplicationRecord
  # has_one_attached :image
  
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :physiology, dependent: :destroy
  has_one :physical_symptom, dependent: :destroy
  has_one :mental_manifestation, dependent: :destroy
  has_one :pregnancy, dependent: :destroy
  has_one :graph, dependent: :destroy
  has_one :calenda, dependent: :destroy
  
  belongs_to :user
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
