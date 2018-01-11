class PetsController < ApplicationController

  def index
    # TODO: set up data for index view
    @owner=Owner.find(params[:owner_id])
  end

  def show
    # TODO: set up data for show view
    
    @pet=Pet.find(params[:id])

  end

  def new
    @pet=Pet.new
    @owner=Owner.find(params[:owner_id])
  end

  def create
    pet= Pet.new(pet_params)
    owner=Owner.find(params[:owner_id])
    if pet.save
      owner.pets << pet
      redirect_to owner_pets_path(owner,pet)
    else
      flash[:error] = pet.errors.full_messages.join(", ")
      redirect_to new_owner_pet_path(owner)
    end
  end
  # TODO: set up *new* method with data for new view

  # TODO: set up *create* method with database interactions for create
  # TODO: handle save errors and communicate issues to user

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
