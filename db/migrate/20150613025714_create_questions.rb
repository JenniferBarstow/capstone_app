class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer :quiz_id
    	t.string :content
    	t.json :answers, default: []
    	t.integer :answer_id
    end

    remove_column :quizzes, :question, :string
    remove_column :quizzes, :answer, :string
  end
end
