Rails.application.routes.draw do
  root 'static_pages#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resource :static_pages,         only: [:index, :show]
end