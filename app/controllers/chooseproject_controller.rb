class ChooseProjectController < ApplicationController
  def new
    @project = Project.new
    @project_types = ProjectType.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      # send emails and do whatever
      flash[:notice] = 'Project created!'
      redirect_to projects_path
    else
      # render the form again
      @project_types = ProjectType.all
      render action: :new
    end
  end

  def index
    @projects = Project.all
  end

  private

  # we need to whitelist parameters to tell rails its ok to use them
  def project_params
    params.require(:project).permit(:email, :project_type_id, :team_name, :leader)
  end
