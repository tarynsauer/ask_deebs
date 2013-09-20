class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  
  has_many :taggings
  has_many :tags, through: :taggings
  
  has_many :question_followeds
  has_many :followers, :through => :question_followeds, :source => :users

  validates :content, :presence => true

  def tags=(str)
    tags_array = str.split(",")
    tags = tags_array.map { |tag| tag.strip.downcase }

    tags.each do |tag|
      self.tags.find_or_create_by(name: tag)
    end
  end

  def self.search(term)
    if term
      find(:all, :conditions => ['content LIKE ?', "%#{term}%"])
    else
      find(:all)
    end
  end

end
