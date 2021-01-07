# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  post '/follow/:id' => 'relationships#follow', as: 'follow'
  post '/unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get "/users/search" => 'users#search'
  resources :users, only: [:show, :edit, :update]
  get "/groups/:group_id/add_user" => "groups#add_user"
  resources :groups, only: [:new, :create, :show, :edit, :update] do
    resources :group_users, only: [:create, :destroy]
  end
end
