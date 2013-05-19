class AddResponsesTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :tweet_id
      t.datetime :datetime
      t.string :body
      t.string :name
      t.integer :poll_id
      t.timestamps
    end
  end
end
