class DumpsController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    pet.dumps.create({ time_went: Time.now.localtime  })
    redirect_to pets_path
  end

end

