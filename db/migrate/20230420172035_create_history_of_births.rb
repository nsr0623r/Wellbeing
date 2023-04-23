class CreateHistoryOfBirths < ActiveRecord::Migration[6.1]
  def change
    create_table :history_of_births do |t|
      t.integer :user_id
      t.datetime :date_of_birth
      t.integer :parity
      t.integer :method
      t.text :birth_record
      
      t.timestamps
    end
  end
end
