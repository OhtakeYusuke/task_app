class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスク完了"
    else
      render :new
    end

  end

  def show
    
  end

  def edit
    
  end

  def update
    
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク#{task.name}を編集しました"
  end

  def destroy
    
    @task.destroy
    redirect_to tasks_url, notice: "タスクを#{task.name}削除しました"
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find_by(id: params[:id])
  end

end
