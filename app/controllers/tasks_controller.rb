# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(user_id: current_user.id, visible: true)
      .order(created_at: 'DESC')
      .paginate(page: params[:page], per_page: 10)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    authorize!(:show, @task)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    authorize!(:edit, @task)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    authorize!(:update, @task)
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    authorize!(:destroy, @task)
    @task.visible = false
    @task.save
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def change_status
    task = Task.find(params[:task_id])
    authorize!(:change_status, task)
    task.status = params[:status]
    respond_to do |format|
      if task.save
        format.json { render json: { message: 'Status da tarefa alterado!', status: 'success' } }
      else
        format.json { render json: { message: 'Falha ao alterar status da tarefa', status: 'error' } }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:status, :body, :priority, :finish_at, :user_id)
  end
end
