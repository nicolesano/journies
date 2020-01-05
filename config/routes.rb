Rails.application.routes.draw do
  root 'journals#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :journals do
    resources :entries
    resources :habits, shallow: true
  end
end
