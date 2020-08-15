class UsersController < ApplicationController
  def index
    @search = User.order(created_at: :desc).ransack(params[:q])
    @users = @search.result.includes(:pets).page(params[:page])
  end
end
