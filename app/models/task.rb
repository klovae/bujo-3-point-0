class Task < ApplicationRecord
    belongs_to :day
    validates :content, presence: { message: "Please add a description to your task." }
end
