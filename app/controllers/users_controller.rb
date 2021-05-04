class UsersController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = User.find(params[:id])
    @user_trips = Listing
                  .joins('JOIN bookings ON listings.id = bookings.listing_id')
                  .joins('JOIN users ON users.id = listings.user_id')
                  .select('listings.*, check_in_date, users.name, bookings.id AS book')
                  .where("bookings.user_id LIKE #{current_user.id}")
                  .paginate(page: params[:page], per_page: 5)
  end
end
