class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new # needed to instantiate the form_for
    end

    def create
        @task = Task.new(task_params)
        @task.save
        # Will raise ActiveModel::ForbiddenAttributesError
        redirect_to task_path(@task)
    end
    def edit
        @task = Task.find(params[:id])
    end
 # PATCH http://localhost:3000/restaurants/3
  def update
    @task = Task.find(params[:id]) # before_action
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # DELETE http://localhost:3000/restaurants/3
  def destroy
    @task = Task.find(params[:id]) # before_action
    @task.destroy
    redirect_to tasks_path
  end
private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end


end
