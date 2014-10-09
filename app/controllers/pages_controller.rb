class PagesController < ApplicationController

  def about
    @courses = Course.all.order('identifier ASC')
    @jobs = Job.all.order('title ASC')
  end

  def contact
  end

  def resume
    @courses = Course.all.order('identifier ASC')
    @jobs = Job.all.order('title ASC')
  end
end
