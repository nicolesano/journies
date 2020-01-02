class AddJournalToHabits < ActiveRecord::Migration[5.2]
  def change
    add_reference :habits, :journal, foreign_key: true
  end
end
