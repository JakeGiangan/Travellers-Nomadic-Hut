class UsersController < ApplicationController
  before_action :user_signed_in?
  include ReviewsHelper

  def show
    @user = User.find(params[:id])
    @user_trips = Listing
                  .joins('JOIN bookings ON listings.id = bookings.listing_id')
                  .joins('JOIN users ON users.id = listings.user_id')
                  .select('listings.*, check_in_date, users.name, bookings.id AS book')
                  .where("bookings.user_id = #{current_user.id}")
                  .paginate(page: params[:page], per_page: 5)

    @listing_list = Listing.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
 
    @host_reviews =  current_user.reviews
                      .joins('JOIN bookings ON reviews.booking_id = bookings.id')
                      .paginate(page: params[:page], per_page: 5)

    @guest_reviews =  Review
                      .joins('JOIN bookings ON reviews.booking_id = bookings.id')
                      .joins('JOIN users ON users.id = reviews.user_id')
                      .where.not(user_id: @user.id)
                      .paginate(page: params[:page], per_page: 5)
  end
end
