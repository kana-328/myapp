class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @date = Pet.find_by_sql(current_date_sql)
    respond_to do |format|
      format.html
      format.json { render :json => @reservations.to_json(only: [:title, :start_date, :end_date, :id, :name]) }
    end
  end

  def new
    @reservation = Reservation.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.pet_id = params[:pet_id]
    if @reservation.save
      flash[:notice] = 'を登録しました'
      redirect_to reservations_path
    else
      flash[:notice] = '登録に失敗しました'
      render :new
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    flash[:notice] = '予約を消しました'
    redirect_to reservations_path
  end

  def current_date_sql
    "SELECT * FROM  pets JOIN reservations ON pets.id = reservations.pet_id WHERE current_date BETWEEN reservations.start_date AND reservations.end_date ORDER BY reservations.start_date"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:title, :start, :end, :pet_id)
  end
end
