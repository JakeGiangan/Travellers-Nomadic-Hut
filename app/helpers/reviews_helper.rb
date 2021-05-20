module ReviewsHelper
  def fetch_reviews(listing)
    Review
    .where("bookings.listing_id = #{listing.id} and reviews.user_id != #{listing.user_id}")
    .joins('JOIN bookings ON reviews.booking_id = bookings.id')
    .joins('JOIN users ON users.id = reviews.user_id')
    .paginate(page: params[:page], per_page: 3)
  end

  def fetch_review_score(listing)
    Review
    .where("bookings.listing_id = #{listing.id} and reviews.user_id != #{listing.user_id}")
    .joins('JOIN bookings ON reviews.booking_id = bookings.id')
    .pluck('AVG(rating)')
  end
end
