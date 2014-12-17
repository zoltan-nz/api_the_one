class ProjectsController < ApplicationController

  # before_action :authenticate_user!

  def index
    @projects = Project.all
    respond_with({ projects: @projects }, root: false)
  end

  def create
    @project = Project.new(project_params)
    @project.save
    render json: { project: @project }
  end

  def show
    @project = Project.find(params[:id])
    render json: { project: @project }
  end

  def edit
  end

  def delete
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
