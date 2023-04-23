class CreateVaccinationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccination_histories do |t|
      t.integer :user_id
      t.date :inoculation_date
      t.integer :amount
      t.string :vaccination

      t.timestamps
    end
  end
end
