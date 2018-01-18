Rails.application.routes.draw do
  get 'order_items/create'

  devise_for :users
  resources :users do
    resources :orders do
      get :review
    end
  end
  resources :menus, only: [:show, :index]
  resources :menu_items
  resources :order_items, only: [:create, :update, :destroy]
  root 'menus#index'
end
