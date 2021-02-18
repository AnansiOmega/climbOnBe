class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.boolean :connected, default: false
      t.timestamps
    end
  end
end
