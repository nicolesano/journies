class DropHabitTrackers < ActiveRecord::Migration[5.2]
  def change
    drop_table :habit_trackers
  end
end
