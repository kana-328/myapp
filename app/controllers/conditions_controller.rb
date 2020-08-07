class ConditionsController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @condition = Condition.new
  end

  def show
  end

  def create
    @id = params[:pet_id]
    @condition = Condition.new(params_condition)
    @condition.pet_id = @id
    if @condition.save
      flash[:notice] = '管理表を登録しました'
      redirect_to user_pets_path
    else
      render "new"
      flash[:danger] = '管理表の登録が失敗しました'
    end
  end

  private
  def params_condition
    params.require(:condition).permit(:vitality, :defecation, :urination, :appetite, :vomit, :comment,:staff)
  end
end
