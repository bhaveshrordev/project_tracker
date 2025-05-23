# app/controllers/activities_controller.rb
class ActivitiesController < ApplicationController
  
  def index
    @project = Project.find(params[:project_id])
    @activities = @project.activities.order(created_at: :desc)
  end

  def create
    @project = Project.find(params[:project_id])
    @activity = @project.activities.build(
      kind: params[:kind],
      content: params[:content],
      user: current_user
    )

    if @activity.kind == "status_change"
      @project.update(status: @activity.content)
    end

    if @activity.save
      redirect_to @project, notice: "Activity added!"
    else
      redirect_to @project, alert: "Something went wrong."
    end
  end
end
