# frozen_string_literal: true

require 'rails_helper'

describe Task do
  describe 'validations' do
    subject { task }

    let(:task) { FactoryBot.build(:task) }

    it { expect { task.body = nil }.to(change { task.valid? }.from(true).to(false)) }
    it { expect { task.priority = nil }.to(change { task.valid? }.from(true).to(false)) }
  end
end
