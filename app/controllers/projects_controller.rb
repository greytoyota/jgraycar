class ProjectsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_project, only: [:edit, :update, :destroy]

  # Create a blank project to be used by form.
  def new
    @project = Project.new
  end

  # Push a new project to the database with inputted parameters.
  # If saved successfully redirects to show project, otherwise back to form.
  def create
    @project = Project.new(project_params)
 
    if @project.save
      redirect_to projects_path + "##{@project.slug}"
    else
      render 'new'
    end
  end

  # Default method for projects. Gives all current projects and alumni.
  def index
    @projects = Project.all.order('title ASC, year')
  end

  # Give project whose ID or slug matches request, to be used by form.
  def edit
  end

  # Find project whose ID or slug matches request, then update parameters
  # to new inputted values. If updates successfully redirects to show project,
  # otherwise back to edit form.
  def update
    if @project.update(project_params)
      redirect_to projects_path + "##{@project.slug}"
    else
      render 'edit'
    end
  end

  # Erase project from database, then redirect to index page.
  def destroy
    @project.destroy
    
    redirect_to projects_path
  end

  private
  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :link, :description, :year, :icon,
                                    :delete_icon)
  end
end
