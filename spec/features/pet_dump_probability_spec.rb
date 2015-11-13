require 'rails_helper'

feature 'pet dump need to go' do

  let(:user){ create(:user, :with_pet) } 
  let(:pet){ user.pets.first }

  context 'when user signed in with pet' do

    scenario 'if pet has no dumps need to go is unknown' do
      sign_in_as(user)
      visit pets_path
      expect(page).to have_content(pet.name)
      expect(page).not_to have_content('last dump')
      expect(page).to have_content('need to go: unknown') 
    end

  end

end
