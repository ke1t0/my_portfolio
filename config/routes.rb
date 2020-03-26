Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users do
    member do
      get :following, :followers, :follow_page
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'searches/user'
end
