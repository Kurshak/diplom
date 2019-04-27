class AddSubCategoryToClaim < ActiveRecord::Migration[5.2]
  def change
    remove_column :claims, :category_id
    add_column :claims, :sub_category_id, :integer
  end
end
