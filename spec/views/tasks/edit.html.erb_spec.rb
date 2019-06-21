# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/edit", type: :view) do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @task = assign(:task, create(:task, user_id: @user.id))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "textarea[name=?]", "task[body]"

      assert_select "select[name=?]", "task[priority]"
    end
  end
end
