Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  resources :password_resets, only: %i[new create edit update]
  resources :users, only: %i[new create show] 

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'

  root 'static_pages#top'
  get  'privacy_policy', to: 'static_pages#privacy_policy'
  get  'terms_of_service', to: 'static_pages#terms_of_service'
  
  resources :tops, only: [:new]
  resources :profiles

  resources :posts

  resources :dashboards, only: %i[index]
  resources :exercise_progresses, only: %i[index new create show]

  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :exercise_plans, only: %i[index new create edit destroy update]
    resources :users, only: %i[index destroy edit update]
    resources :profiles, only: %i[index update edit new create]
    resources :exercise_progress_comments, only: %i[new create]
  end
end

