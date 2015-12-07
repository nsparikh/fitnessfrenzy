class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :user_id
      t.integer :challenge_id


      t.timestamps
    end
    add_index :messages, :challenge_id
  end
end
