class Day < ApplicationRecord
    belongs_to :user
    has_many :tasks

    def human_time
        self.date.strftime("%a, %B %-d, %Y")
    end
end
