class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :dumps
  validates_presence_of :name

  def average_dumps_per_day
    dumps = daily_dumps
    dumps.values.inject(:+) / dumps.count
  end

  private

  def daily_dumps
    dumps.group("DATE_TRUNC('day', time_went)").count
  end
end
