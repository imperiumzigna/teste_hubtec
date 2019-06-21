# frozen_string_literal: true
require 'ffaker'

FactoryBot.define do
  factory :task do
    body { FFaker::Lorem.sentence }
    priority { ['baixa', 'normal', 'alta'].sample }
    status { 'ativa' }
    visible { true }
    association :user, factory: :user
  end
end
