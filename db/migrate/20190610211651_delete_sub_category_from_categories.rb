# frozen_string_literal: true

class DeleteSubCategoryFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :sub_category_id, :integer
  end
end
