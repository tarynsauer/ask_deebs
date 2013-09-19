class Question < ActiveRecord::Base
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
end
