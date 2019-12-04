class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    review = @shelter.reviews.new(review_params)
    
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:notice] = 'Review Not Created! Make Sure To Fill In Title, Rating, And Content!'
      render :new
    end
  end

    ########### PRIVATE METHODS ###########

    private

    def review_params
      params.permit(:title, :rating, :content, :picture)
      # params.permit(:picture, :optional => true)
    end
end
