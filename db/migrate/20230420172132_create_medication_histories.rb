class CreateMedicationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :medication_histories do |t|
      t.integer :user_id
      t.string :medicine
      t.text :objective
      t.date :start_date
      t.date :end_date
      t.integer :taking_status
      t.text :medicine_comment

      t.timestamps
    end
  end
end
