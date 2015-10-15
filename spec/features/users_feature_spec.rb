require 'rails_helper'

feature 'user can sign in and out ' do
  context 'user not signed in on homepage' do
  
    it 'has sign in and sign up link' do
      visit root_path
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it 'does not have sign out link' do
      visit root_path
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on the homepage' do

    before do
      visit root_path
      click_link('Sign up')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it 'has sign out link' do
      visit root_path
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
