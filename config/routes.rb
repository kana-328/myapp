Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
  root 'static_pages#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resource :static_pages,         only: [:show]
end