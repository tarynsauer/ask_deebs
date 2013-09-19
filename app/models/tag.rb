class Tag < ActiveRecord::Base

  validates :question_id, :presence => true
  validates :tag_id, :presence => true

  has_many :taggings
  has_many :questions, through: :taggings
end
