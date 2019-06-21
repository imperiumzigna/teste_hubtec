# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can(:manage, Task, user_id: user.id)
  end
end
