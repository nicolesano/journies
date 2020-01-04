class Habit < ApplicationRecord
    belongs_to :journal

    has_many :completed_dates
end
