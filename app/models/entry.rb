class Entry < ApplicationRecord
    belongs_to :journal
    has_one_attached :photo
end
