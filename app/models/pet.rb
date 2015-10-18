class Pet < ActiveRecord::Base

  belongs_to :user
  has_many :toilets
  validates_presence_of :name

end
