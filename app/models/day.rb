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
        current_day = Day.find_by_id(params[:id])
        Day.where("date > ? AND user_id = ?", current_day.date, current_user.id).first
    end

    def previous_day
        current_day = Day.find_by_id(params[:id])
        Day.where("date < ? AND user_id = ?", current_day.date, current_user.id)[-2]
    end
end
