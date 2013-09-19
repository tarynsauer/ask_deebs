class CreateQuestionFolloweds < ActiveRecord::Migration
  def change
    create_table :question_followeds do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.timestamps
    end
  end
end
