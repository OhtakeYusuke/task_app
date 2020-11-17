class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスク完了"
    else
      render :new
    end

  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    task = Task.find_by(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク#{task.name}を編集しました"
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスクを#{task.name}削除しました"
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description)
  end

end
