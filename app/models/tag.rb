class Tag < ActiveRecord::Base
  has_many :questions, through: :taggings
end
