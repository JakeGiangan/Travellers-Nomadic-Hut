class UsersController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = User.find(params[:id])
    @user_trips = Booking
                  .joins('JOIN listings ON listings.id = bookings.listing_id')
                  .joins('JOIN users ON users.id = listings.user_id')
                  .select('listing_name, check_in_date, users.first_name, users.last_name, bookings.id')
                  .where(user_id:  params[:id])
                  .paginate(page: params[:page], per_page: 5)
  end
end
