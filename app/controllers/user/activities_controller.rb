class User::ActivitiesController < ApplicationController
  before_filter :check_for_activities , only: [:index]

  def index
  	@activities=@activities=Activity.includes(:city,:category).where("start_date >= ?", Date.current)
  end

 def check_for_activities
        redirect_to dashboard_path if Activity.count == 0 or Activity.where("start_date >= ?", Date.current).count == 0
        flash[:notice] = "Currently there are no activities available in any city"
 end


end
