class MigrationsController < ApplicationController

    def create
        task = Task.find_by_id(params[:task_id])
        day_id = task.day.id

        if task.day == Day.today(current_user.id)
          new_day = Day.tomorrow(current_user.id)
        else #if migrating from a previous day to current day
          new_day = Day.today(current_user.id) 
        end
        
        migrate = Migration.create(task_id: task.id, day_id: day_id, new_day_id: new_day.id)
        task.day = new_day
        task.save
        flash[:success] = "Task migrated"
        redirect_to day_path(day_id)
    end

end