class TasksController < ApplicationController
    
    def index
        @tasks = current_user.tasks.where(["status = ?", "open"])
    end
    
    def new
        @day = Day.find_by_id(params[:day_id])
        @task = Task.new(day_id: @day.id)
    end

    def create
        @task = Task.create(task_params)
        if @task.valid?
            redirect_to day_path(@task.day)
        else
            flash[:errors] = @task.errors
            redirect_to new_day_task_path(@task.day.id)
        end
    end

    def show
    end

    def edit
        @task = Task.find_by_id(params[:id])
        if @task.update(task_params)
            redirect_to day_path(@task.day)
        else
            flash.now[:errors] = @task.errors
            render :edit
        end
    end

    def update
    end

    def destroy
    end

    private

    def task_params
        params.require(:task).permit(:content, :day_id, :user_id)
    end
        
end