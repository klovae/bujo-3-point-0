class MigrationsController < ApplicationController

    def create
        task = Task.find_by_id(params[:task_id])

        if task.day.date <= Day.today(current_user.id).date #if migrating from any day today or earlier
            day_id = task.day.id

            if task.day == Day.today(current_user.id) #if migrating from today
                new_day = Day.tomorrow(current_user.id)
            
            else #if migrating from a day prior to today
                new_day = Day.today(current_user.id) 
            end
            
            migrate = Migration.create(task_id: task.id, day_id: day_id, new_day_id: new_day.id)
            task.day = new_day
            task.save
            flash[:success] = "Task migrated"
            redirect_to day_path(day_id)
        
        else #if trying to migrate from Day.tomorrow
            flash[:error] = "Tomorrow's tasks cannot be migrated."
            redirect_to day_path(task.day.id)
        end
        
    end

end