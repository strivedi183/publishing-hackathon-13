class AddTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :poll_id
      t.timestamps
    end
  end
end
