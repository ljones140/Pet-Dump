require 'rails_helper'

feature 'average dumps a day' do

  let(:user_one_daily){ create(:user, :with_one_daily_dump_pet) }

  context 'when pet has daily dumps' do

    scenario 'shows average 1 dump a day' do
      sign_in_as(user_one_daily)
      visit pets_path
      expect(page).to have_content('average dumps a day: 1')
    end

  end

end
