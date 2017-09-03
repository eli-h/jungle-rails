class ReviewsController < ApplicationController
  
  before_filter :authorize

  def create
  	@product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user
    @review.save

    if @review.save
    	redirect_to @product, notice: 'review created'
    else
    	redirect_to @product, notice: 'not logged in'
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to [:products], notice: 'Review deleted'
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  # private

  # def user_auth
  #   unless current_user
  #     @review = @product.reviews.new(review_params)
  #   end
  # end

end
