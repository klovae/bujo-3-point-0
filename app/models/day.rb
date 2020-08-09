class Day < ApplicationRecord
    belongs_to :user
    has_many :tasks

    def human_time
        self.date.strftime("%A, %B %-d, %Y")
    end

    def self.today(user_id)
        find_or_create_by(date: Time.zone.today.beginning_of_day, user_id: user_id)
    end

    def self.tomorrow(user_id)
        find_or_create_by(date: Time.zone.tomorrow.beginning_of_day, user_id: user_id)
    end

    def next_day
        self.user.days.where("date > ?", self.date).first
    end

    def previous_day
        self.user.days.where("date < ?", self.date).last
    end
end
