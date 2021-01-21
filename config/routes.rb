# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  post '/follow/:id' => 'relationships#follow', as: 'follow'
  delete '/unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get "/users/search" => 'users#search'
  resources :users, only: [:show, :edit, :update] do
    get "/followed" => 'users#followed', as: 'follower'
    resources :tasks, only: [:index, :create, :update, :destroy]
  end
  resources :groups, only: [:new, :create, :show, :edit, :update] do
    resources :group_users, only: [:create, :destroy]
    resources :questions, only: [:new, :create, :index, :show] do
      resources :answers,only: [:edit, :update]
    end
    get "/events/:id/add_user" => "events#add_user", as: 'add_user_event'
    get "/events/:id/event_mail" => "events#event_mail", as: 'event_mail'
    get "/events/:id/event_confirm" => "events#event_confirm", as: 'event_confirm'
    resources :events, only: [:new, :create, :show, :edit, :update] do
      resources :event_users, only: [:create, :destroy]
    end
  end
  resources :notifications, only: [:index]
  delete "/notifications/destroy_all" => "notifications#destroy_all"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
