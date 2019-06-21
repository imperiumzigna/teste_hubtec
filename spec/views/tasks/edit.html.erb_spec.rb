# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/edit", type: :view) do
  before(:each) do
    @task = assign(:task, Task.create!(
      body: "MyText",
      priority: "MyString",
      user: nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "textarea[name=?]", "task[body]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[user_id]"
    end
  end
end
