class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.save

    if @review.save
    	redirect_to [:products], notice: 'review created'
    # else
    # 	render :new
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
