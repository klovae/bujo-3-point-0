class TasksController < ApplicationController
    
    def index
        @tasks = current_user.tasks.where(["status = ?", "open"])
    end
    
    def new
        @day = Day.find_by_id(params[:id])
    end

    def create
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
        params.require(:task).permit(:content)
    end
        
end