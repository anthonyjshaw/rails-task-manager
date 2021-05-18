# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_tasks, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @completed_task = @task.completed ? 'This task is completed.' : 'This task is not completed yet.'
  end

  def edit; end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :edit
    end
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
    params.require(:task).permit(:title, :details, :completed)
  end
end
