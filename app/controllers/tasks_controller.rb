class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.new(task_params)
    @tasks = current_user.tasks

    if @task.save
      redirect_to :tasks
    else
      render :index
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    redirect_to :tasks
  end

  private

  def task_params
    params.require(:task).
      permit(
        :body,
        :title,
        :completed,
    )
  end
end

