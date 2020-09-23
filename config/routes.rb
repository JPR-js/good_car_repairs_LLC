Rails.application.routes.draw do
  get 'welcome/index'
  resources :reservations
  resources :users do
    member do
      get :confirmation
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'

end
