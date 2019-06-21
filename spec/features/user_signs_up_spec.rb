# frozen_string_literal: true

require 'rails_helper'

feature 'User signs up' do
  before(:each) do
    @user = build(:user)
  end
  scenario 'with valid data' do
    visit new_user_registration_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    click_button 'Registrar'

    expect(page).to(have_link('Logout'))
    expect(page).to(have_current_path(root_path))
  end

  scenario 'with invalid data' do
    visit new_user_registration_path

    click_button 'Registrar'

    expect(page).to(have_no_link('Logout'))
  end
end
