# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  status     :boolean          default("desativada")
#  body       :text             default("")
#  priority   :integer          default("baixa")
#  finish_at  :datetime
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  visible    :boolean          default(TRUE)
#
require 'rails_helper'

describe Task do
  describe 'validations' do
    before(:each) do
      @task = build(:task)
    end

    it { expect { @task.body = nil }.to(change { @task.valid? }.from(true).to(false)) }
    it { expect { @task.priority = nil }.to(change { @task.valid? }.from(true).to(false)) }
  end
end
