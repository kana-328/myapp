class ReservationsController < ApplicationController
  def index

  end

  def new
    @reservation = Reservation.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.pet_id = params[:pet_id]
    if @reservation.save
      flash[:notice] = '予約を登録しました'
      redirect_to reservations_path
    else
      flash[:notice] = '登録に失敗しました'
      render :new
    end
  end

  private

  def reservation_params
    params
      .require(:reservation).permit(:title, :start, :end, :pet_id)
  end
end
