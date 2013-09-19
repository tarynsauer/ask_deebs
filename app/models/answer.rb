class Answer < ActiveRecord::Base
  has_many :votes
  belongs_to :question
end
