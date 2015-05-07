class AddLeadTable < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.integer :score
      t.integer :remaining_time
      t.boolean :disabled, default: false

      t.string :email
      t.string :phone_number
      t.string :address

      t.integer :portal_user_id
      t.foreign_key :portal_users

      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end
  end
end
