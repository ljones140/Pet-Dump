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
 end
