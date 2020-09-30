class TasksController < ApplicationController
  def index
    @tasks =Task.all
  end 
  
  def show
    @task = Task.find(params[:id])
  end 
  
  def new 
    @task = Task.new
  end 
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "task が正常に作成されました"
      redirect_to @task
    else
      flash.now[:danger] = "task が正常に作成されませんでした"
      render :new
    end
  end 
  
  def edit
    @task =Task.find(params[:id])
  end 
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "task は正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "task は正常に更新されませんでした"
      render :edit
    end 
  end 
  
  def destroy
    @task =Task.find(params[:id])
    @task.destroy
    
    flash[:success] ="task は正常に削除されました"
    redirect_to tasks_path
  end 
end

private

def task_params
  params.require(:task).permit(:content)
end 