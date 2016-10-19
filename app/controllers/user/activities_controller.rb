class User::ActivitiesController < ApplicationController
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
