class AddSuggestionsTable < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.integer :response_id
      t.timestamps
    end
  end
end
