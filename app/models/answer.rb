class Answer < ActiveRecord::Base

  validates :content, :presence => true

  has_many :votes
  belongs_to :question
  belongs_to :user

end
