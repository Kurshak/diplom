class AddCategoryToSubCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_categories, :category_id, :integer
  end
end
