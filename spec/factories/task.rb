# frozen_string_literal: true
require 'ffaker'

FactoryBot.define do
  factory :task do
    body { FFaker::Lorem.sentence }
    priority { (0..2).to_a.sample }
    status { true }
    visible { true }
    association :user, factory: :user
  end
end
