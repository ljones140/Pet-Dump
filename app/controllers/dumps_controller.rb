class DumpsController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    pet.dumps.create({ time_went: TimeConvert.convert_to_time(params[:dump]) })
    redirect_to pets_path
  end

end

