# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/show", type: :view) do
  before(:each) do
    @task = assign(:task, Task.create!(
      body: "MyText",
      priority: "Priority",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/Priority/))
    expect(rendered).to(match(//))
  end
end
