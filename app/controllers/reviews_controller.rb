class ReviewsController < ApplicationController

  def create
  	@product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.name
    @review.save

    if @review.save
    	redirect_to @product, notice: 'review created'
    else
    	redirect_to @product, notice: 'not logged in'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
