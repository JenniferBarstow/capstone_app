class RenameTeacherIdToUserId < ActiveRecord::Migration
  def change
  	rename_column :classrooms, :teacher_id, :user_id
  end
end
