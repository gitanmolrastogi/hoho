class User::ActivitiesController < ApplicationController
  before_filter :check_for_activities , only: [:index]

  # def index
  # 	@activities=@activities=Activity.includes(:city,:category).where("start_date >= ?", Date.current)
  # end

 def check_for_activities
        redirect_to dashboard_path if Activity.count == 0 or Activity.where("start_date >= ?", Date.current).count == 0
        flash[:notice] = "Currently there are no activities available in any city"
 end


   def index
   	@activities = Activity.paginate(:page => params[:page] , :per_page => 2)
# or, use an explicit "per page" limit:
# Post.paginate(:page => params[:page], :per_page => 30)
## render page links in the view:

   end
   
   def show
  @activity = Activity.find_by(id: params[:id])
p "=====================================ACTIVITY====================================="
  p @activity
   end
end
