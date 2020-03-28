Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users, only: [:index, :show, :destroy] do
    member do
      get :following, :followers
    end
    collection do
      delete :destroy_image
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'searches/user'
end
