class BodiesController < ApplicationController

  def new
    @body = Body.new
    @pet = Pet.find(params[:pet_id])
    gon.condition = Body.where(pet_id: @pet.id).pluck(:weight)
    gon.recorded_date = Body.where(pet_id: @pet.id).pluck(:created_at)
  end
  def create
    @condition = Body.new(params_bodies)
    @condition.pet_id = params[:pet_id]
    if @condition.save
      flash[:success] = '更新しました'
      redirect_to request.referrer || 
    else
      flash[:notice] = '失敗しました'
      render 'new'
  end

  private

  def params_bodies
    params.require(:body).permit(:weight)
  end
end
