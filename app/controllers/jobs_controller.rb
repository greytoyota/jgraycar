class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_job, only: [:show, :edit, :update, :destory]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def index
    @jobs = Job.all
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def destroy
    @job.destory

    redirect_to jobs_path
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :start_date, :end_date, :location, :description)
  end
end
