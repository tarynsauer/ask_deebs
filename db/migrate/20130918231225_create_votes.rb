class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :like

      t.timestamps
    end
  end
end
