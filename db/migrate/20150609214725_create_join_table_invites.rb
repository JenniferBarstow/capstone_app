class CreateJoinTableInvites < ActiveRecord::Migration
  def change
    create_join_table :classrooms, :students, table_name: :invites do |t|
       t.index [:classroom_id, :student_id]
       t.index [:student_id, :classroom_id]

       t.timestamps null: false
    end
  end
end
