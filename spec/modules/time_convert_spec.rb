require 'rails_helper'

RSpec.describe TimeConvert do

  time_select  = { "time_went(1i)"=>"2015", 
                   "time_went(2i)"=>"10", 
                   "time_went(3i)"=>"28", 
                   "time_went(4i)"=>"13", 
                   "time_went(5i)"=>"11" }

  it 'converts time_select hash to time' do
    expect(subject.convert_to_time(time_select)).to eq("2015-10-28 13:11:00.000000000 +0000");
  end

  it 'returns instance of Time' do
    expect(subject.convert_to_time(time_select)).to be_a(Time)
  end

end
