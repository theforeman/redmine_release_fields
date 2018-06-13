class ReleasesController < ApplicationController
  before_filter :find_project, :authorize, :only => :index

  def index
    @open_releases   = @project.releases.where(status: 'open')
    @closed_releases = @project.releases.where(status: 'closed')
  end

  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
