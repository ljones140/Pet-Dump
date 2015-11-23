class Pet < ActiveRecord::Base

  belongs_to :user
  has_many :dumps
  validates_presence_of :name

  def average_dumps_per_day
    dumps = daily_dumps
    dumps.values.inject(:+) / dumps.count
  end

  def need_to_go
    return "high" if dumps_today < average_dumps_per_day && Time.now.strftime("%H:%M") > avg_dump_times
    return "low" if dumps_today >= average_dumps_per_day
    return "unknown"
  end

  def avg_dump_times
    size = dump_times.size
    avg_minutes = dump_times.map do |x|
      hour, minute = x.split(':')
      total_minutes = hour.to_i * 60 + minute.to_i
    end.inject(:+)/size
    "%s:%s" % avg_minutes.divmod(60).map(&:to_i)
  end

  def daily_dumps
    dumps.group("DATE_TRUNC('day', time_went)").count
  end

  def dump_times
    dumps.map(&:time_went).map{ |t| t.strftime "%H:%M" }
  end

  def dumps_today
    dumps.where(["time_went >= ?", Time.now.beginning_of_day]).count
  end

end
