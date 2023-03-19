class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :posted_text
      t.float :temperature
      t.float :weight
      t.float :body_fat_percentage
      t.datetime :start_time,     null: false
      t.boolean :release,          null: false, default: false
      

      t.timestamps
    end
  end
end
