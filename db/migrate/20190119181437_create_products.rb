class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.boolean :published
      t.datetime :deleted_at
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
