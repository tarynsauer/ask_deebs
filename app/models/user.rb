class User < ActiveRecord::Base

  validates :email, presence: true,
              format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :questions_followed
  has_many :followed_questions, :through => :questions_followed, :source => :questions


end
