class AddAddressTable < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :apt_number
      t.string :city
      t.string :state
      t.string :zip

      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end
  end
end
