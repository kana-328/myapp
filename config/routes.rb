Rails.application.routes.draw do
  root 'static_pages#index'

  devise_scope :user do
    get     '/signup',         to: 'users/registrations#new'
    post    '/signup',         to: 'users/registrations#create'
    get     '/users/:id/edit', to: 'users/registrations#edit', as: 'user_edit_registration'
    patch  '/users/:id',      to: 'users/registrations#update', as: 'users_registration'
    delete  '/users/:id',      to: 'users/registrations#destroy'
    post    '/login',          to: 'users/sessions#create'
    get     '/login',          to: 'users/sessions#new'
    delete  '/logout',         to: 'users/sessions#destroy'
    get     '/static_pages/introduce',  to: 'static_pages#introduce'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resource :introduce,       only: [:index]
  resource :static_pages,    only: [:show]
  resources :contacts,       only: [:new, :create]
  resources :users,    only: [:index] do
    resources :pets, only: [:new, :index, :create] 
    end
  resources :pets, only: [:show, :edit, :update, :destroy] do
    resources :conditions, shallow: true
    resources :bodies, only: [:new, :create, :destroy]
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end