class AddClassroomIdToQuizzes < ActiveRecord::Migration
  def change
  	add_column :quizzes, :classroom_id, :integer
  end
end
