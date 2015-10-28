require 'rails_helper'

RSpec.describe TimeConvert do

  date_hash = {"time_went(1i)"=>"2015", 
                 "time_went(2i)"=>"10", 
                 "time_went(3i)"=>"28", 
                 "time_went(4i)"=>"13", 
                 "time_went(5i)"=>"11"}
  
  it 'converts select_time params has into date array' do
    expect(subject.convert_to_time(date_hash)).to eq("2015-10-28 13:11:00.000000000 +0000");
  end
end
