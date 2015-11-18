module PetsHelper

  def last_dump(pet)
    pet.dumps.maximum("time_went").localtime.strftime("%H:%M %d/%m/%Y")
  end

  def average_dumps_per_day(pet)
    daily_dumps = pet.dumps.group("DATE_TRUNC('month', created_at)").count
    daily_dumps.map(&:last).inject(:+) / daily_dumps.count
  end

end
