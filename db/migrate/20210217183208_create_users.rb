class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :gender
      t.string :climbing_preference
      t.integer :commitment
      t.string :skill_level
      t.text :bio
      t.string :password_digest
      t.string :street
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
