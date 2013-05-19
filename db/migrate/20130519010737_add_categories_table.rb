class AddCategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :suggestion_id
      t.timestamps
    end
  end
end
