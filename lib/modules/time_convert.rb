module TimeConvert

  def self.convert_to_time(hash)
    time = %w(1 2 3 4 5).map { |element| hash["time_went(#{element}i)"].to_i }
    Time.new(*time)
  end

end
