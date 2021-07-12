Rails.application.routes.draw do
  devise_for :users
  root to: "abouts#index"
  resources :work_manuals do
    resources :procedures, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :how_tos, only: [:index]
end
