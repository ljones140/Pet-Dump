require 'rails_helper'

RSpec.describe Pet, type: :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many :toilets }

end
