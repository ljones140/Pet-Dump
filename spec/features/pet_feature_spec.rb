require 'rails_helper'

feature 'pets' do
  context 'when user not signed in ' do
    scenario 'displays sign up message' do
      visit root_path
      expect(page).to have_content 'Join us to track your pets business'
    end
  end
 end
