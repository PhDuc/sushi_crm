class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :crypted_password
      t.string :external_id
      t.boolean :is_portal_user

      t.integer :portal_user_id
      t.foreign_key :portal_users

      t.timestamps
    end
  end
end
