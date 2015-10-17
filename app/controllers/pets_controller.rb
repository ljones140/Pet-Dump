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
		@pet.save
		redirect_to pets_path
  end

	def pet_params
		params.require(:pet).permit(:name)
	end

end
