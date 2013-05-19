class AddPollsTable < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :tweet_id
      t.datetime :datetime
      t.string :question
      t.boolean :is_active, :default => true
      t.integer :user_id
      t.timestamps
    end
  end
end
