# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  post '/follow/:id' => 'relationships#follow', as: 'follow'
  post '/unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get "/users/search" => 'users#search'
  resources :users, only: [:show, :edit, :update]
  resources :groups, only: [:new, :create, :show, :edit, :update] do
    resources :group_users, only: [:create, :destroy]
    get "/events/:id/add_user" => "events#add_user", as: 'add_user_event'
    resources :events, only: [:new, :create, :show, :edit, :update] do
      resources :event_users, only: [:create, :destroy]
    end
  end
  resources :notifications, only: [:index]
  delete "/notifications/destroy_all" => "notifications#destroy_all"
end
