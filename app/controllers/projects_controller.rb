class ProjectsController < ApplicationController
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
    @project_item = Project.new(params.require(:project).permit(:title, :subtitle, :body, technologies_attributes:[:name]))

    respond_to do |format|
      if @project_item.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @project_item = Project.find(params[:id])

  end

  def update
    @project_item = Project.find(params[:id])

    respond_to do |format|
      if @project_item.update(params.require(:project).permit(:title, :subtitle, :body))
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @project_item = Project.find(params[:id])
  end

  def destroy
    @project_item = Project.find(params[:id])
    @project_item.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully removed.' }
    end
  end
end
