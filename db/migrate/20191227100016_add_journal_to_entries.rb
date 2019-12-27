class AddJournalToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :journal, foreign_key: true
  end
end
