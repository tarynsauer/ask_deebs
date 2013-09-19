class Tag < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :taggings
  has_many :questions, through: :taggings
end
