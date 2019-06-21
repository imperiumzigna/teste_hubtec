# frozen_string_literal: true

require 'ffaker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  Task.create(status: ['ativa', 'desativada'].sample , body: FFaker::Lorem.sentence, priority: ['baixa', 'normal', 'alta'].sample, user_id: 1)
end