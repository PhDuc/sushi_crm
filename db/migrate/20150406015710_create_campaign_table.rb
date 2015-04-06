class CreateCampaignTable < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :type
      t.string :name
      t.string :external_id
      t.integer :limit

      t.timestamps
    end
    add_index :campaigns, :external_id
  end
end
