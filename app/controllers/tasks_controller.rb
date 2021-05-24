class TasksController < ApplicationController
    before_action :find_task, only: [:update, :destroy]


    def index
        @tasks = Task.where(user_id: @@user.id)
        render json: {tasks: @tasks}, status: :ok
    end

    def show
        @task = Task.find_by(id: params[:id])
        @tasks = @task.tasks
        render json: {task: @task, tasks: @tasks}, status: :ok
    end 
    
    def create
        @task = Task.new(task_params)
        if @task.valid?
            @task.save
            render json: @task, status: :ok
        else
            render json: {message: "You fucked up.", errors: @task.errors}, status: :not_acceptable
        end
    end

    def update
        if @task.update(task_params)
            render json: @task, status: :ok
        else
            render json: {msg: "Failed Update"}, status: :not_acceptable
        end
    end

    def destroy
        if @task.destroy
            render json: {message: "Blog successfully deleted."}, status: :ok
        else 
            render json: {message: "You fucked up.", errors: @task.errors}, status: :not_acceptable
        end
    end

    private

    def find_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit!
    end
end
