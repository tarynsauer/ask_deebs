class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :question_followeds
  has_many :followers, :through => :question_followeds, :source => :user

  validates :content, :presence => true

  def tags=(str)
    tags_array = str.split(",")
    tags = tags_array.map { |tag| tag.strip.downcase }

    tags.each do |tag|
      self.tags << Tag.find_or_create_by(name: tag)
    end
  end
end
