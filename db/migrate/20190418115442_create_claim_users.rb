class CreateClaimUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :claim_users do |t|
      t.integer :user_id
      t.integer :claim_id
      t.timestamps
    end
  end
end
