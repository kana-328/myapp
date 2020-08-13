class UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @users = @search.result.includes(:pets).page(params[:page])
  end
end
