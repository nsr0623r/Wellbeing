class CreateCommutingToHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :commuting_to_hospitals do |t|
      t.integer :user_id
      t.string :hospital_name
      t.date :day_of_a_hospital_visit
      t.text :objective
      
      t.timestamps
    end
  end
end
