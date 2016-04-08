class BookingsController < ApplicationController
  def index
  end
  
  def requests_made
    @requested_bookings = current_user.requested_bookings
  end
  
  def requested_for
    @requested_for = current_user.booking_requests
  end
  
  # making a request for a dog sitter
  def new
  end
  
  # making a request for a dog sitter
  def create
  end
  
  # editing a request made
  def edit
  end
  
  # show an individual request
  def show
  end
  
  # cancel a request made
  def destroy
  end
  
end