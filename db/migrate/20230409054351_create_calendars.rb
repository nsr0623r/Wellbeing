class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.references :post, null: false, foreign_key: true
      t.datetime :visit_day

      t.timestamps
    end
  end
end
