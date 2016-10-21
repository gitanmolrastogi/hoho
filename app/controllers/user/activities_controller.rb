class User::ActivitiesController < ApplicationController
  before_filter :check_for_activities , only: [:index]

  # def index
  # 	@activities=@activities=Activity.includes(:city,:category).where("start_date >= ?", Date.current)
  # end

  def check_for_activities
    if Activity.count == 0 or Activity.where("start_date >= ?", Date.current).count == 0
        redirect_to dashboard_path 
        flash[:notice] = "Currently there are no activities available in any city"
    end
  end

  def index
  	@activities = Activity.paginate(:page => params[:page] , :per_page => 2)
  end

  def show
  @activity = Activity.find_by(id: params[:id])
  end
  
end
