class ProjectsController < ApplicationController
  def index
    @project_items = Project.all
  end

  def new
    @project_item = Project.new
  end

   def create
    @project_item = Project.new(params.require(:project).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @project_item.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

end
