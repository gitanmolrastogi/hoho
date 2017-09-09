class User::BookingsController < ApplicationController
  def index
  	@bookings = Booking.where(user_id: current_user)
  	@passes = PassBooking.where(user_id: current_user)
  end

  def set_default_pass
     
    if (PassBooking.where.not(id: params[:pass_book_id]).update_all(default_pass: false)) && ( PassBooking.find_by(id: params[:pass_book_id]).update(default_pass: true))
       flash[:notice] = "Default pass is successfully updated."
       redirect_to :back
    else
       flash[:notice] = "Update unsuccessful. Please try again."
       redirect_to :back
    end
  end
end
