require 'rails_helper'

RSpec.describe Toilet, type: :model do

  it { is_expected.to belong_to :pet }

end
