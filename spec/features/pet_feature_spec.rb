require 'rails_helper'

feature 'pets' do
  
  let(:user){ create(:user) }

  context 'when user not signed in' do
    scenario 'displays sign up message' do
      visit root_path
      expect(page).to have_content('Join us to track your pets business')
    end
  end

  context 'when user signed in' do
    scenario 'displays no pets added' do
      visit root_path
      sign_in_as(user)
      expect(page).not_to have_content('Join us to track your pets business')
      expect(page).to have_content('no pets added yet')
      expect(page).to have_link('add a pet')
    end
  end

  context 'pets have been added' do
   
    let(:user_with_pet){ create(:user_with_pet) } 
  
    scenario 'display pets' do
      visit root_path
      sign_in_as(user_with_pet)
      visit pets_path
      expect(page).to have_content(user_with_pet.pets.first.name)
      expect(page).not_to have_content('no pets added yet')
    end
  end
 end
