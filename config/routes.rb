Rails.application.routes.draw do
  devise_for :users
  root to: "abouts#index"
  resources :work_manuals do
    resources :procedures, only: [:create, :destroy]
    resources :approvals, only: [:index, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :messages, only: [:new, :create]
  resources :how_tos, only: [:index]
  resources :abouts, only: [:index]
end
