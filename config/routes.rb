Rails.application.routes.draw do

  devise_scope :user do
    root   'users/sessions#new'
    get     '/signup',         to: 'users/registrations#new'
    post    '/signup',         to: 'users/registrations#create'
    get     '/users/:id/edit', to: 'users/registrations#edit', as: 'user_edit_registration'
    patch   '/users/:id',      to: 'users/registrations#update', as: 'users_registration'
    delete  '/users/:id',      to: 'users/registrations#destroy'
    post    '/login',          to: 'users/sessions#create'
    delete  '/logout',         to: 'users/sessions#destroy'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resource :static_pages,         only: [:show]
  resources :users,    only: [:index] do
    resources :pets, only: [:new, :index, :create] 
    end
  resources :pets, only: [:edit, :update, :destroy] do
    resources :conditions, shallow: true
    resources :bodies, only: [:new, :create, :destroy]
  end
end