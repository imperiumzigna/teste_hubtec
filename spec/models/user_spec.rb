# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#


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
