class ProjectsController < ApplicationController
  before_action :set_project_item, only: [:edit, :show, :update, :destroy]
  layout 'project'
  def index
    @project_items = Project.all
  end

  def ios
    @ios_project_items = Project.ios
  end

  def new
    @project_item = Project.new
    3.times { @project_item.technologies.build }
  end

  def create
    @project_item = Project.new(project_params)

    respond_to do |format|
      if @project_item.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @project_item.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    binding.pry
  end

  def destroy
    @project_item.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully removed.' }
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, 
                                    :subtitle, 
                                    :body, 
                                    technologies_attributes:[:name]
                                    )
  end

  def set_project_item
    @project_item = Project.find(params[:id])
  end
end
