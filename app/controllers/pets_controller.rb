class PetsController < ApplicationController

  def index
    if @user ||= current_user
      @pets = @user.pets
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      flash[:notice] = "pet name required"
      redirect_to new_pet_path
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name)
  end

end
