class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.string :question
    	t.string :answer

    	t.timestamps null: false
    end
  end
end
