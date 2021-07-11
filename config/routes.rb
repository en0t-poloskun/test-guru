# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    resources :gists, only: :create
  end

  namespace :admins do
    resources :gists, only: :index
    resources :badges
  end

  scope module: 'admins' do
    resources :tests, except: :index do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  get 'admins/tests', to: 'admins/tests#index'
end
