class AddCategoryIdToBoard < ActiveRecord::Migration[5.0]
  def change
    rename_column :boards, :category, :category_id
  end
end
