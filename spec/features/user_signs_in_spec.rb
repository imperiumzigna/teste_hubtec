# frozen_string_literal: true

require 'rails_helper'

feature 'User signs in' do
  before(:each) do
    @user = create(:user)
  end

  scenario 'with valid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Login'
    expect(page).to(have_link('Logout'))
    expect(page).to(have_current_path(root_path))
  end

  scenario 'with invalid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'user_password', with: 'dsdasdasacsc'
    click_button 'Login'

    expect(page).to(have_no_link('Logout'))
  end
end
