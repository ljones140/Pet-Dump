module TimeConvert

  def self.convert_to_time(params)
    Time.new(*params.sort.map(&:last).map(&:to_i))
  end

end
