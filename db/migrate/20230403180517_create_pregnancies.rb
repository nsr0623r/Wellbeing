class CreatePregnancies < ActiveRecord::Migration[6.1]
  def change
    create_table :pregnancies do |t|
      t.integer :post_id
      t.boolean :morning_sickness
      t.boolean :belching
      t.boolean :backache_during_pregnancy
      t.boolean :anaemia
      t.boolean :sour_stomach
      t.boolean :pulsation

      t.timestamps
    end
  end
end
