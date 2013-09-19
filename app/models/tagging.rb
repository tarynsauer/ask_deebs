class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :question

  validates :question_id, :presence => true
  validates :tag_id, :presence => true
end
