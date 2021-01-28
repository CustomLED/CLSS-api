class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :name
      t.text :text
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
