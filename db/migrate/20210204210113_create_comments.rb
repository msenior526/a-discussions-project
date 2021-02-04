class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :posts, foreign_key: {on_delete: :cascade}
      t.timestamps null: false
    end
  end
end
