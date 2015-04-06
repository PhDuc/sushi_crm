class CreateFeedbackTable < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :type
      t.text :content
      t.text :user_note
      t.string :external_id

      t.integer :feedback_question_id
      t.foreign_key :feedback_questions

      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end

    add_index :feedbacks, :external_id
    add_index :feedbacks, :user_id
    add_index :feedbacks, :feedback_question_id
  end
end
