class CreateCompletedDates < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_dates do |t|
      t.datetime :date
      t.references :habit, foreign_key: true

      t.timestamps
    end
  end
end
