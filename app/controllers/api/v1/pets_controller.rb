class Api::V1::PetsController < ApplicationController

  # GET /api/v1/users/user_id/pets
  # Returns an array with the list of all pets of an user
  def index
    @pets = Pet.where(user_id: params[:user_id])
    render json: @pets
  end

  # GET /api/v1/users/:user_id/pets/:id
  # Returns the details of a single pet of a user
  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  # POST /api/v1/users/:user_id/pets/
  # Creates a new pet for the user
  def create
    @pet = Pet.new(pet_params)
    render json: @pet && return if @pet.save

    render json: { error: "Unable to save pet: #{@pet.errors.messages}" }, status: 400
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :kind, :age_in_years, :user_id)
  end
end
