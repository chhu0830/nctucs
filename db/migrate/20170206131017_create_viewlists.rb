class CreateViewlists < ActiveRecord::Migration[5.0]
  def change
    create_table :viewlists do |t|
      t.integer :board_id
      t.integer :user_id
      t.integer :permission

      t.timestamps
    end
  end
end
