# frozen_string_literal: true

require 'rails_helper'

feature 'User signs out' do
  before(:each) do
    @user = create(:user)
  end
  scenario 'user signed in' do
    sign_in @user

    visit root_path

    click_link 'Logout'

    expect(page).to(have_no_link('Logout'))
    expect(page).to(have_current_path(root_path))
  end
end
