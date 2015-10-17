require 'rails_helper'

feature 'pets' do

  let(:user){ create(:user) }
  let(:user_with_pet){ create(:user_with_pet) } 

  context 'when user not signed in' do
    scenario 'displays sign up message' do
      visit root_path
      expect(page).to have_content('Join us to track your pets business')
    end
  end

  context 'when user signed in' do
    scenario 'displays no pets added' do
      sign_in_as(user)
      expect(page).not_to have_content('Join us to track your pets business')
      expect(page).to have_content('no pets added yet')
      expect(page).to have_link('add a pet')
    end
  end

  context 'pets have been added' do

    scenario 'display pets' do
      sign_in_as(user_with_pet)
      expect(page).to have_content(user_with_pet.pets.first.name)
      expect(page).not_to have_content('no pets added yet')
    end

    scenario 'only allows owner to see their pets' do
      sign_in_as(user)
      expect(page).not_to have_content(user_with_pet.pets.first.name)
      expect(page).to have_content('no pets added yet')
    end
  end

  context 'adding pets' do
    scenario 'user fills out form, then displays pet' do
      sign_in_as(user)
      visit pets_path
      click_link('add a pet') 
      fill_in 'Name', with: 'Harry'
      click_button 'Create Pet'
      expect(page).to have_content('Harry')
      expect(current_path).to eq(pets_path)
    end

    scenario 'user does not add name, error displayed' do
      sign_in_as(user)
      visit pets_path
      click_link('add a pet')
      click_button 'Create Pet'
      expect(page).to have_content('pet name required')
      expect(current_path).to eq(new_pet_path)
    end
  end
end
