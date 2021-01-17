class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
    @tasks = @tasks.page(params[:page]).per(5)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      @tasks = Task.where(user_id: current_user.id)
      @tasks = @tasks.page(params[:page]).per(5)
    else
      render 'index'
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(status: true)
    redirect_to user_tasks_path(current_user)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:task, :limit_date, :status)
  end

end
