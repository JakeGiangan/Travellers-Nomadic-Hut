module BookingHelper
  def check_for_review(user_id, booking_id)
    return Review.where(user_id: user_id, booking_id: booking_id).present?
  end
end
