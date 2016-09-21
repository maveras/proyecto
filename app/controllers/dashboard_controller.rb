class DashboardController < ApplicationController
  def index
  	@request_by_day = Request.group_by_day(:create_at).count
  end


end
