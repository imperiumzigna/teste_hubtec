# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.boolean(:status, default: false)
      t.text(:body, default: '')
      t.integer(:priority, default: 0)
      t.datetime(:finish_at)
      t.references(:user, foreign_key: true)

      t.timestamps
    end
  end
end
