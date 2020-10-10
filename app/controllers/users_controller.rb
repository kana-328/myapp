class UsersController < ApplicationController
  def index
    @search = User.sorted.ransack(params[:q])
    @users = @search.result.page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.csv { send_data @users.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def import
    # fileはtmpに自動で一時保存される
    User.import(params[:file])
    redirect_to users_path
  end
end
