class UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true)
  end
end
