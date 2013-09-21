class Answer < ActiveRecord::Base

  validates :content, :presence => true

  has_many :votes
  belongs_to :question
  belongs_to :user

  def count_ups
    self.votes.where(:like => true).count
  end

  def count_downs
    self.votes.where(:like => false).count

  end

  def count_total_likes
    self.count_ups - self.count_downs
  end

  def self.search(term)
    if term
      find(:all, :conditions => ['lower(content) LIKE ?', "%#{term.downcase}%"])
    end
  end

end
