class AddSortToHabit < ActiveRecord::Migration[5.2]
  def change
    add_column :habits, :sort, :integer
  end
end
