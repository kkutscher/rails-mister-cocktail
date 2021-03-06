Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'cocktails#home'
  resources :cocktails, only: [:home, :index, :show, :create, :new, :destroy] do
    resources :doses, only: [:create, :new]
  end
  resources :doses, only: [:destroy]
end
