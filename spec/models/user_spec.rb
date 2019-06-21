# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe 'validations' do
    subject { user }

    let(:user) { FactoryBot.build(:user) }

    it { expect { user.email = nil }.to(change { user.valid? }.from(true).to(false)) }
    it { expect { user.password = nil }.to(change { user.valid? }.from(true).to(false)) }
    it { expect { user.password_confirmation = nil }.to(change { user.valid? }.from(true).to(false)) }
  end
end
