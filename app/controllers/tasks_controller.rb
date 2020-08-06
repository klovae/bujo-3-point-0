class TasksController < ApplicationController
    
    def index
        @tasks = current_user.tasks.where(["status = ?", "open"])
    end
    
    def new
        @day = Day.find_by_id(params[:day_id])
        @task = Task.new(day_id: @day.id)
    end

    def create
        @day = Day.find_by_id(params[:day_id])
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def task_params
        params.require(:task).permit(:content, :user_id, :day_id)
    end
        
end