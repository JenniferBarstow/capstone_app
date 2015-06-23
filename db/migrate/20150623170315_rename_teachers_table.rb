class RenameTeachersTable < ActiveRecord::Migration
  def change
  	rename_table :teachers, :users
  end
end
