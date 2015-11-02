require 'rails_helper'

RSpec.describe TimeConvert do

  time_select  = { "date_time_element(1i)"=>"2015", 
                   "date_time_element(2i)"=>"10", 
                   "date_time_element(3i)"=>"28", 
                   "date_time_element(4i)"=>"13", 
                   "date_time_element(5i)"=>"11" }

  let(:time){ subject.convert_to_time(time_select) }

  it 'converts time_select params to correct time' do
    expect(time.strftime("%H:%M %d/%m/%Y")).to eq("13:11 28/10/2015");
  end

  it 'returns an instance of Time' do
    expect(subject.convert_to_time(time_select)).to be_a(Time)
  end

end
