Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  get  'privacy_policy', to: 'static_pages#privacy_policy'
  get  'terms_of_service', to: 'static_pages#terms_of_service'
end
