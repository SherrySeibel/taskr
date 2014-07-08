class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
    @tasks = current_user.tasks.not_completed.order("created_at DESC")
  end

  def create
    @task = current_user.tasks.new(task_params)
    @tasks = current_user.tasks

    if request.xhr?
      if @task.save
        render @task
      end
    else
      if @task.save
        redirect_to :tasks
      else
        render :index
      end
    end
  end

  def update
    task = current_user.tasks.find(params[:id])

    task.update_attribute(:completed, true)

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

