class TasksController < ApplicationController
  before_action :set_task, except: [:index, :create, :new]
  before_action :require_user

  def index
    @tasks = Task.order(:id).page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)    
    if @task.save
      flash[:notice] = "Tarefa criada com sucesso."
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Tarefa alterada com sucesso."
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :due_at, :status, :user_id, :priority)
  end

end