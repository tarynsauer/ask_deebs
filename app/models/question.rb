class Question < ActiveRecord::Base

  validates :content, :presence => true

  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  has_many :question_followeds
  has_many :followers, :through => :question_followeds, :source => :users
end
