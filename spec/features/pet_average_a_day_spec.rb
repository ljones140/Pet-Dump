require 'rails_helper'

feature 'average dumps a day' do

  let(:user){ create(:user, :with_one_daily_dump_pet) }
  let(:pet){ user.pets.first }

  context 'when pet has one dump a day' do

    scenario 'shows average dumps per day' do
      sign_in_as(user)
      visit pets_path
      expect(page).to have_content(pet.name)
    end
  end

end
