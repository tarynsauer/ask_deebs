class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :like
      t.belongs_to :user
      t.belongs_to :answer

      t.timestamps
    end
  end
end
