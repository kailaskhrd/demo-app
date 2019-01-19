class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :rank
      t.boolean :is_active
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :categories, :deleted_at
  end
end
