class CreateFavoriteposts < ActiveRecord::Migration[5.2]
  def change
    create_table :favoriteposts do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
