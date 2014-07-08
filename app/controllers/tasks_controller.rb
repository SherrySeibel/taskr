class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
    @tasks = current_user.tasks
  end

  def create
    current_user.tasks.create(task_params)

    redirect_to :tasks # Don't redirect to root_path! root_path can change.
  end

  private

  def task_params
    params.require(:task).
      permit(
        :body,
        :title,
    )
  end
end

