class BodiesController < ApplicationController
  def new
    @body = Body.new
    @pet = Pet.find(params[:pet_id])
    gon.weight = Body.where(pet_id: @pet.id).pluck(:weight)
    gon.recorded_date = Body.where(pet_id: @pet.id).pluck(:recorded_date)
  end

  def create
    @body = Body.new(params_bodies)
    @body.pet_id = params[:pet_id]
    @body.save
    flash[:notice] = '更新しました'
    redirect_to request.referrer || root_path
  end

  private

  def params_bodies
    params.require(:body).permit(:weight, :recorded_date)
  end
end
