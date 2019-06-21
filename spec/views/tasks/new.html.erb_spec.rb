# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/new", type: :view) do
  before(:each) do
    @user = create(:user)
    sign_in @user
    assign(:task, Task.new)
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "textarea[name=?]", "task[body]"

      assert_select "select[name=?]", "task[priority]"
    end
  end
end
