# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/index'
  resources :tasks do
    get '/change' => 'tasks#change_status'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
  }, path: '/', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#index'
end
