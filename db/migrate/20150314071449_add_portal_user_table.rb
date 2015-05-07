class AddPortalUserTable < ActiveRecord::Migration
  def change
    create_table :portal_users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :crypted_password
      t.string :external_id
      t.string :legal_name

      t.timestamps
    end
  end
end
