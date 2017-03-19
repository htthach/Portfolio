class ProjectsController < ApplicationController
  def index
    @project_items = Project.all
  end
end
