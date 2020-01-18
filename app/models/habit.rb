class Habit < ApplicationRecord

    include RailsSortable::Model
    set_sortable :sort

    belongs_to :journal

    has_many :completed_dates
end
