class ReviewsController < ApplicationController
  
  def new
    # we need @restaurant in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end
  
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render "cocktails/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
