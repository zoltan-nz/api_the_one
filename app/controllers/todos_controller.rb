class TodosController < ApplicationController

  def index
    @todos = Todo.where(project_id: params[:id])
    render json: {todos: @todos}
  end

  def create
    render json: {}
  end

end
