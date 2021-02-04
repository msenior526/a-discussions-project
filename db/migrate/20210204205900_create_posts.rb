class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: {on_delete: :cascade}
      t.timestamps null: false
    end
  end
end
