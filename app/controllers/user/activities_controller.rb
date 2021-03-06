class User::ActivitiesController < ApplicationController
  before_filter :check_for_activities , only: [:index]

  # def index
  # 	@activities=@activities=Activity.includes(:city,:category).where("start_date >= ?", Date.current)
  # end

  def check_for_activities
    if Activity.count == 0 or Activity.where("start_date >= ? AND is_active = ?", Date.current, true).count == 0
        redirect_to dashboard_path 
        flash[:warning] = "Currently there are no activities available in any city"
    end
  end

  def index
    #@activities = Activity.where("end_date > ?" ,Date.current)
    @activities = Activity.where("start_date >= ? AND is_active = ?" ,Date.current, true)
  	@activities = @activities.paginate(:page => params[:page] , :per_page => 5)
  end

  def show
    @activity = Activity.find_by(id: params[:id])
  end
  
  def read_more
    @object= Activity.find_by(id: params[:object_id])
  end

  def read_less
    @object= Activity.find_by(id: params[:object_id])
  end
end
