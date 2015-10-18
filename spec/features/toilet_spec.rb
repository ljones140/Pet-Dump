require 'rails_helper'

feature 'toilet' do

  let(:user){ create(:user_with_pet) } 
  let(:pet){ user.pets.first }

  time = Time.local(2015, 10, 18, 18, 0)

  context 'when user signed in with pet' do

    before do
      sign_in_as(user)
      Timecop.freeze(time)
    end

    scenario 'can record time a pet goes to the  toilet' do
      visit pets_path
      expect(page).to have_content(pet.name)
      click_button('Record Toilet')
      expect(page).to have_content('last dump at 18:00 16/08/2015')
    end
  end

end
