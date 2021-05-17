class TasksController < ApplicationController
  before_action :set_tasks, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show

    @completed_task = if @task.completed
                        "This task is completed"
                      else
                        "This task is not completed yet."
                      end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def set_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
