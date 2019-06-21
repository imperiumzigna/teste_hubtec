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


class Task < ApplicationRecord
  belongs_to :user
  enum status: { desativada: false, ativa: true }
  enum priority: { baixa: 0, normal: 1, alta: 2 }

  validates :body, presence: true
end
