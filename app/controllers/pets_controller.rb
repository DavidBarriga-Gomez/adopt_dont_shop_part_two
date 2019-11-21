class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def shelter_pets_index
    @shelter = Shelter.find(params[:shelter_id])
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    # binding.pry
    Pet.create(pet_params)

    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  ########### PRIVATE METHODS ###########

  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :status, :shelter_id)
  end
end
