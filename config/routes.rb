Rails.application.routes.draw do

  root 'static_pages#index'
  devise_scope :user do
    get     '/signup',         to: 'users/registrations#new'
    post    '/signup',         to: 'users/registrations#create'
    get     '/login',           to: 'users/sessions#new'
    post    '/login',          to: 'users/sessions#create'
    delete  '/logout',         to: 'users/sessions#destroy'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resource :static_pages,         only: [:index, :show]
  resources :users,    only: [:create, :destroy] do
    resources :pets, only: [:new, :show, :create, :destroy]
  end
end