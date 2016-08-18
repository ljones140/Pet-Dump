require 'rails_helper'

feature 'average dumps a day' do
  let(:user_one_daily) { create(:user, :with_one_daily_dump_pet) }
  let(:user_two_daily) { create(:user, :with_two_daily_dump_pet) }
  let(:user_no_dumps) { create(:user, :with_pet) }

  time = Time.utc(2015, 10, 18, 10, 00)

  context 'when pet has daily dumps' do
    before { Timecop.freeze(time) }

    scenario 'shows average 1 dump a day' do
      sign_in_as(user_one_daily)
      visit pets_path
      expect(page).to have_content('average dumps a day: 1')
    end

    scenario 'shows average 2 dumps a day' do
      sign_in_as(user_two_daily)
      visit pets_path
      expect(page).to have_content('average dumps a day: 2')
    end
  end

  context 'when pet has zero dumps' do
    scenario 'shows average 0 dumps a day' do
      sign_in_as(user_no_dumps)
      visit pets_path
      expect(page).not_to have_content('average dumps a day:')
    end
  end
end
