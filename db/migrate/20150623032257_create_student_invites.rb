class CreateStudentInvites < ActiveRecord::Migration
  def change
    create_table :student_invites do |t|
    	t.string :email
    	t.boolean :checked

    	t.timestamps null: false
    end
  end
end
