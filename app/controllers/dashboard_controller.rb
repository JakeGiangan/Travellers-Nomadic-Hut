class DashboardController < ApplicationController
  def dashboard
    @users_listings = current_user.listings
    @bookings = Booking.where(id: @users_listings)
    @booked = @bookings.count
    @completed = Review.where(booking_id: @bookings).count
  end
    
end
