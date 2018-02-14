class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
