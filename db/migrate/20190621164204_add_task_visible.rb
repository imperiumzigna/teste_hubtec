# frozen_string_literal: true

class AddTaskVisible < ActiveRecord::Migration[5.2]
  def change
    add_column(:tasks, :visible, :boolean, default: true)
  end
end
