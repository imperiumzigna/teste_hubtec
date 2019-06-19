# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }, path: '/', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # defaults to dashboard
  root to: redirect('/login')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
