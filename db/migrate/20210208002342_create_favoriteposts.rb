class CreateFavoriteposts < ActiveRecord::Migration
  def change
    create_table :favoriteposts do |t|

      t.timestamps null: false
    end
  end
end
