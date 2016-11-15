# frozen_string_literal: true
Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
