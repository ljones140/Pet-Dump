class Pet < ActiveRecord::Base

  belongs_to :user
  has_many :dumps
  validates_presence_of :name

end
