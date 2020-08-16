class ConditionsController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    @conditions_by_date = @pet.conditions.order(created_at: "DESC").group_by { |condition| condition.recorded_date }
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(params_condition)
    @condition.pet_id = params[:pet_id]
    if @condition.save
      flash[:notice] = '管理表を登録しました'
      redirect_to pet_conditions_path(pet_id: @condition.pet_id)
    else
      @pet = Pet.find(params[:pet_id])
      flash[:notice] = '管理表の登録が失敗しました'
      render "new"
    end
  end

  def show
    @condition = Condition.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    gon.condition = Condition.where(pet_id: @pet.id).pluck(:weight)
    gon.recorded_date = Condition.where(pet_id: @pet.id).pluck(:recorded_date)
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update(params_condition)
    flash[:notice] = '管理表を更新しました'
    redirect_to pet_conditions_path(pet_id: @condition.pet_id)
  end

  def destroy
    condition = Condition.find_by(id: params[:id]).destroy
    flash[:notice] = '管理表を消しました'
    redirect_to pet_conditions_path(pet_id: condition.pet_id)
  end

  private

  def params_condition
    params.require(:condition).permit(:vitality, :defecation, :urination, :appetite, :vomit, :weight, :comment, :staff, :recorded_at, :medicine, :recorded_date)
  end
end
