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
    let(:user){ create(:user) }
    
    before do
      def sign_in_as(user)
        visit root_path
        click_link('Sign in')
        fill_in('Email', with: user.email)
        fill_in('Password', with: user.password)
        click_button('Log in')
      end
    end

    it 'has sign out link' do
      sign_in_as(user)
      visit root_path
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
