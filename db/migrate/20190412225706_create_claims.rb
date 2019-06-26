class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :title,     null: false, default: '', limit: 50
      t.text :description,     null: false, default: '', limit: 50
      t.boolean :done,     null: false, default: false
      t.float :lat
      t.float :lon
      t.integer :owner_id
      t.integer :category_id 

      t.timestamps
    end
  end
end
