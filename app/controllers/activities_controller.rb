class ActivitiesController < ApplicationController

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

end
