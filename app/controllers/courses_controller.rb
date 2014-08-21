class CoursesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def show
  end

  # Create a blank course to be used by form.
  def new
    @course = Course.new
  end

  # Push a new course to the database with inputted parameters.
  # If saved successfully redirects to show course, otherwise back to form.
  def create
    @course = Course.new(course_params)
 
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  # Default method for courses. Gives all current courses and alumni.
  def index
    @courses = Course.all
  end

  # Give course whose ID or slug matches request, to be used by form.
  def edit
  end

  # Find course whose ID or slug matches request, then update parameters
  # to new inputted values. If updates successfully redirects to show course,
  # otherwise back to edit form.
  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  # Erase course from database, then redirect to index page.
  def destroy
    @course.destroy
    
    redirect_to courses_path
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :link, :identifier)
  end
end

