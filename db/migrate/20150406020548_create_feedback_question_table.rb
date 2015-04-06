class CreateFeedbackQuestionTable < ActiveRecord::Migration
  def change
    create_table :feedback_questions do |t|
      t.string :type
      t.text :content
      t.string :external_id

      t.integer :campaign_id
      t.foreign_key :campaigns

      t.timestamps
    end

    add_index :feedback_questions, :external_id
    add_index :feedback_questions, :campaign_id
  end
end
