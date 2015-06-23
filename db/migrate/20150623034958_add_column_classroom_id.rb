class AddColumnClassroomId < ActiveRecord::Migration
  def change
  	add_column :student_invites, :classroom_id, :integer
  end
end
