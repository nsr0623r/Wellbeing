class CreatePhysicalSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :physical_symptoms do |t|
      t.integer :post_id
      t.boolean :physical_good
      t.boolean :no_malfunction
      t.boolean :tired
      t.boolean :washed_out_feeling
      t.boolean :lumbago
      t.boolean :stomach_ache
      t.boolean :headache
      t.boolean :rough_skin
      t.boolean :chilling_exposure
      t.boolean :swelling
      t.boolean :sleepiness
      t.boolean :increased_appetite
      t.boolean :low_appetite
      t.boolean :chest_pain
      t.boolean :nausea
      t.boolean :dazziness
      t.boolean :pollakiuria
      t.boolean :hot_flash
      t.integer :defecute
      t.integer :vaginal_discharge
      t.integer :vaginal_discharge_type
      t.integer :vaginal_bleeding
      t.integer :sex
      t.text :physical

      t.timestamps
    end
  end
end
