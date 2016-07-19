class ActivitiesController < ApplicationController

  # GET /activities
  # GET /activities.json
  def index
    @activities = current_user.activities.where('action_type LIKE ?', "%#{params[:action_type]}%")
  end

end
