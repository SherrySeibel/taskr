class Display
  def initialize(user)
    @user = user
  end

  def new_task
    Task.new
  end

  def incomplete_tasks
    @user.tasks.not_completed
  end
end
