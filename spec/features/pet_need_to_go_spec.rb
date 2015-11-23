require 'rails_helper'

feature 'pet dump need to go' do

  let(:user){ create(:user, :with_pet) } 
  let(:pet){ user.pets.first }
  let(:user_one_daily){ create(:user, :with_one_daily_dump_pet) }

  time = Time.utc(2015, 10, 18, 10, 00)

  context 'pet with no dumps' do

    scenario 'need to go is unknown' do
      sign_in_as(user)
      visit pets_path
      expect(page).to have_content(pet.name)
      expect(page).not_to have_content('last dump')
      expect(page).not_to have_content('need to go:')
    end

  end

  context 'pet with dumps' do

    before do
      Timecop.freeze(time)
    end

    scenario 'should be high if not dumped after average time' do
      Timecop.travel(Time.utc(2015, 10, 19, 11, 00))
      sign_in_as(user_one_daily)
      visit pets_path
      expect(page).to have_content('need to go: high')
    end

    scenario 'should be low if dumped before average time' do
      Timecop.travel(Time.utc(2015, 10, 19, 10, 00))
      sign_in_as(user_one_daily)
      visit pets_path
      click_button('Record Dump')
      expect(page).to have_content('need to go: low')
    end

  end

end
