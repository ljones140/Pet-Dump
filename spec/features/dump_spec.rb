require 'rails_helper'

feature 'dump' do

  let(:user){ create(:user, :with_pet) } 
  let(:pet){ user.pets.first }
  let(:user_dump) {create(:user, :with_dumped_pet) }
  let(:dumped_pet){ user_dump.pets.first }

  time = Time.utc(2015, 10, 18, 17, 00)

  context 'when user signed in with pet' do

    before do
      Timecop.freeze(time)
    end

    scenario 'can record time a pet dumps', js: true  do
      sign_in_as(user)
      visit pets_path
      expect(page).to have_content(pet.name)
      expect(page).not_to have_content('last dump')
      click_button('Record Dump')
      expect(page).to have_content('18/10/2015')
    end

    scenario 'shows the newest dump by time_went' do
      sign_in_as(user_dump)
      visit pets_path
      expect(page).to have_content('last dump at 16:00 18/10/2015')
      click_button('Record Dump')
      expect(page).not_to have_content('last dump at 16:00 18/10/2015')
    end

    scenario 'user can alter the dump time', js: true  do
      sign_in_as(user_dump)
      visit pets_path
      expect(page).to have_content(pet.name)
      page.execute_script("$('#dump_time_went_4i').val('21')")
      click_button('Record Dump')
      expect(page).to have_content('last dump at 21:00 18/10/2015')
    end

  end

end
