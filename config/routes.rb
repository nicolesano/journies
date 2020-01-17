Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :journals do
    resources :entries
    resources :habits do
      member do
        post 'mark'
      end
    end
  end
end
