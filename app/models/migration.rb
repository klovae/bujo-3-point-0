class Migration < ApplicationRecord
    belongs_to :day
    belongs_to :task

    def self.migrated_tasks(day_id)
        tasks_collection = []
        Migration.where('day_id = ?', day_id).find_each do |migration|
            if migration.task #prevents deleted tasks from showing up here
                tasks_collection << migration.task
            end
        end
        tasks_collection
    end
end