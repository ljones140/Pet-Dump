class DumpsController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    dump_time = Time.new(*flatten_to_date(params[:dump]))
    pet.dumps.create({ time_went: dump_time  })
    redirect_to pets_path
  end

  private

  def dump_params
    params.permit(:dump)
  end

  def flatten_to_date(dump)
    %w(1 2 3 4 5).map { |e| dump["time_went(#{e}i)"].to_i }
  end
end

