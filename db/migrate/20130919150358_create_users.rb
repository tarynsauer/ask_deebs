class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :avatar_url
      t.string :oauth_token
      t.string :about

      t.timestamps
    end
  end
end
