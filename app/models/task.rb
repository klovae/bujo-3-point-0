class Task < ApplicationRecord
    belongs_to :day
    validates :content, presence: { message: "A task must have a description." }
end
