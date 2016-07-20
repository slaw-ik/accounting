class ActivitiesController < ApplicationController

  # GET /activities
  # GET /activities.json
  def index
    @activities = current_user.activities.filter_conditions(params[:action_type])
  end

  def types
    render json: Activity.action_types
  end

end
