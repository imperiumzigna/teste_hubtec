# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/new", type: :view) do
  before(:all) do
    @user = create(:user)
    sign_in(@user)
  end

  after :all do
    sign_out(@user)
    @user.destroy
  end

  it "renders new task form" do
    visit new_task_path
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "textarea[name=?]", "task[body]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[user_id]"
    end
  end
end
