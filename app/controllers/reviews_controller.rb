class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_back(fallback_location: root_path, notice: 'Review Posted')
    else
      flash[:alert] = 'Post failed'
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def review_params
    params.require(:review).permit(:booking_id, :content, :rating)
  end
end
