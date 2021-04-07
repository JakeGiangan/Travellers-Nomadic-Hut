class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_back(fallback_location: root_path, notice: "Review Posted")
    end
  end

  private
  def review_params 
    params.require(:review).permit(:listing_id, :user_id, :content, :rating)
  end
end
