# frozen_string_literal: true

require 'rails_helper'

RSpec.describe("tasks/index", type: :view) do
  before(:each) do
    assign(:tasks, create_list(:task, 2))
  end

  it "renders a list of tasks" do
    allow(view).to(receive_messages(will_paginate: nil))
    render
    assert_select "tr>td", count: 14
  end
end
