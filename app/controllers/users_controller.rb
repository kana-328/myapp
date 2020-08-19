class UsersController < ApplicationController
  def index
    @search = User.order(created_at: :DESC).ransack(params[:q])
    @users = @search.result.includes(:pets).page(params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @users.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end

  end
end
