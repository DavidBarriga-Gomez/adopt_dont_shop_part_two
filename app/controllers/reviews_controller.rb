class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])

    @shelter.reviews.create(review_params)

    redirect_to "/shelters/#{@shelter.id}"
  end

    ########### PRIVATE METHODS ###########

    private

    def review_params
      params.permit(:title, :rating, :content, :picture)
      # params.permit(:picture, :optional => true)
    end
end
