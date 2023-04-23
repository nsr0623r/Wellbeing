class CreateHealthHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :health_histories do |t|
      t.integer :user_id
      t.string :disease_name
      t.date :diagnostic_day
      t.text :medical_treatment
      t.text :health_comment

      t.timestamps
    end
  end
end
