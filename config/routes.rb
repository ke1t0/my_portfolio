Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'searches/user'
end
