class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :questions, through: :taggings

  validates_uniqueness_of :name
  validates :name, :presence => true
end
