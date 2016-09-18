class AddBoardIdToPost < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :team_id, :board_id
  end
end
