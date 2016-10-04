Rails.application.routes.draw do

  resources :products
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_scope :user do
    get "users/become-a-chef", to:"users/registrations#chef"
    put "users/reg-a-chef", to:"users/registrations#chef_update"
    get "users/chef", to:"users/chefs#index"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:show]
  resources :orders, only: [:create, :show]

  root to: 'landing#index'

  get "how-it-works", to:"others#how"

  resources :menu do
    get "relist", to:"menu#relist"
  end

  post :follow, to: 'favourite#follow'
end
