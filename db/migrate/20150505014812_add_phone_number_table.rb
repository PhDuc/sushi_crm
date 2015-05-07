class AddPhoneNumberTable < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number

      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end
  end
end
