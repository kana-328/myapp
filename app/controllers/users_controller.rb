class UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @users = @search.result.includes(:pets)
  end
end
