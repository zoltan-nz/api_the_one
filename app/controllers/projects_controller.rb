class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    render json: { projects: @projects }
  end

  def create
  end

  def edit
  end

  def delete
  end

end
