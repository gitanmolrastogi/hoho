class User::BookingsController < ApplicationController
  def index
  	@bookings = Booking.where(user_id: current_user)
  	@passes = PassBooking.where(user_id: current_user)
  end

  def set_default_pass
    if PassBooking.find_by(id: params[:pass_book_id]).default_pass == false

          if (PassBooking.where.not(id: params[:pass_book_id]).update_all(default_pass: false)) && ( PassBooking.find_by(id: params[:pass_book_id]).update(default_pass: true))
             flash[:success] = "Default pass is successfully updated."
             redirect_to :back
          else
             flash[:warning] = "Update unsuccessful. Please try again."
             redirect_to :back
          end

    else
         redirect_to :back
         flash[:warning] = "Default Pass has already been selected."
    end
  end
end
