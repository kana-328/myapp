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
      @condition = Condition.new(params_condition)
      flash[:notice] = '管理表の登録が失敗しました'
      render "new"
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(params_condition)
      flash[:notice] = '管理表を更新しました'
      redirect_to pet_conditions_path(pet_id: @condition.pet_id)
    else
      flash[:notice] = "失敗しました"
      redirect_to edit_condition_path(id: condition_path)
    end
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
