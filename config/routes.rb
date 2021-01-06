# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  get "/users/search" => 'users#search'
  resources :users, only: [:show, :edit, :update]
end
