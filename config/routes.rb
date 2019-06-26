# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    resources :categories, only: %i[index show new create edit update destroy]
    resources :claims, only: %i[index show new create edit update destroy]
    resources :sub_categories, only: %i[index show new create edit update destroy]
    resources :comments, only: %i[index show destroy]
    root 'users#index'
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace 'api' do
    namespace 'v1' do
      resources :categories, only: %i[index show] do
        resources :sub_categories, only: %i[index show] do
          resources :claims do
            resources :comments
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
