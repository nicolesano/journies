class Journal < ApplicationRecord
    has_many :entries
    has_many :habits

    belongs_to :user
end
