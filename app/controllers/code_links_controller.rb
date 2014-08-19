class CodeLinksController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  before_action :set_code_link, only: [:show, :edit, :update, :destroy]

  def index
    @code_links = CodeLink.all.order('project_id ASC')
  end

  def new
    @code_link = CodeLink.new
  end

  def show
  end

  def edit
  end

  def create
    @code_link = CodeLink.new(code_link_params)

    respond_to do |format|
      if @code_link.save
        format.html { redirect_to code_links_url, notice: 'Code link was successfully created.' }
      else
        render 'new'
      end
    end
  end

  def update
    respond_to do |format|
      if @code_link.update(code_link_params)
        format.html { redirect_to code_links_url, notice: 'Code link was successfully updated.' }
      else
        render 'edit'
      end
    end
  end

  def destroy
    @code_link.destroy
    respond_to do |format|
      format.html { redirect_to code_links_url, notice: 'Code link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_code_link
    @code_link = CodeLink.find(params[:id])
  end

  def code_link_params
    params.require(:code_link).permit(:title, :link, :performance_id)
  end
end
