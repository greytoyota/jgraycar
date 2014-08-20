class PagesController < ApplicationController

  def about
    @courses = Course.all.order('identifier ASC')
  end

  def contact
  end
end
