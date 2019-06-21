# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/show", type: :view) do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @task = assign(:task, Task.create!(
      body: "MyText",
      priority: "normal",
      user_id: @user.id
    ))
  end

  it "renders attributes in div" do
    render
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/normal/))
  end
end
