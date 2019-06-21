# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  enum priority: [:low, :normal, :high]

  validates :body, presence: true
  validates :priority, numericality: { only_integer: true }
end
