class CreateMentalManifestations < ActiveRecord::Migration[6.1]
  def change
    create_table :mental_manifestations do |t|
      t.integer :post_id
      t.boolean :mental_good
      t.boolean :mental_normal
      t.boolean :frustrating
      t.boolean :hot_tempered
      t.boolean :emotional_instability
      t.boolean :emotional
      t.boolean :uneasiness
      t.boolean :poor_concentrtion
      t.boolean :lethargy
      t.boolean :melancholy
      t.text :mental

      t.timestamps
    end
  end
end
