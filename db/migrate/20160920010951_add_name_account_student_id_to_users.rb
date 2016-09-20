class AddNameAccountStudentIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :account, :string
    add_column :users, :student_id, :string
  end
end
