class AddEmailTable < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email_address

      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end
  end
end
