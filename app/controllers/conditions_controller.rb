class ConditionsController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
    conditions = @pet.conditions.order(:recorded_date)
    @conditions_by_date = conditions.group_by{|condition| condition.recorded_date}
  end
  
  def new
    @pet = Pet.find(params[:pet_id])
    @condition = Condition.new
  end

  def show
    @pet = Pet.find(params[:pet_id])
    @conditions_1  = @pet.conditions.order(:recorded_date).where(recorded_at: 1)
    @conditions_by_1 = @conditions_1.group_by{|condition| condition.recorded_date}
    @conditions_2 = @pet.conditions.order(:recorded_date).where(recorded_at: 2)
    #@conditions_by_2 = @conditions_2.group_by{|condition| condition.recorded_date}
  end

  def create
    @id = params[:pet_id]
    @condition = Condition.new(params_condition)
    @condition.pet_id = @id
    if @condition.save
      flash[:notice] = '管理表を登録しました'
      redirect_to condition_path(id: @condition.id, pet_id: @id)
    else
      render "new"
      flash[:danger] = '管理表の登録が失敗しました'
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