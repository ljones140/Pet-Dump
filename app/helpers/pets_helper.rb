module PetsHelper

  def last_dump(pet)
    pet.dumps.maximum("time_went").localtime.strftime("%H:%M %d/%m/%Y")
  end

end
