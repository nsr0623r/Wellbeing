class CreatePhysiologies < ActiveRecord::Migration[6.1]
  def change
    create_table :physiologies do |t|
      t.integer :post_id
      t.integer :menstrual_blood_volume
      t.integer :cramps
      t.boolean :medicine,              null: false, default: false
      t.date :physiology_start_date
      t.date :physiology_end_date

      t.timestamps
    end
  end
end
