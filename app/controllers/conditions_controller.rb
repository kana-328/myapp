class ConditionsController < ApplicationController
  def new
    @pet = Pet.find(params[:pet_id])
    @condition = Condition.new
    @conditions = @pet.conditions.sorted
    respond_to do |format|
      format.html
      format.csv { send_data @pet.conditions.generate_csv, filename: "conditions-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @condition = Condition.new(params_condition)
    @condition.pet_id = @pet.id
    @conditions = Pet.includes(:conditions).where(id: @condtiion.pet_id).sorted
    respond_to do |format|
      @condition.save
        flash[:notice] = '記入しました'
        format.js
        format.html { render :new }
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(params_condition)
      flash[:notice] = '管理表を更新しました'
      redirect_to new_pet_condition_path(pet_id: @condition.pet_id)
    else
      flash[:notice] = "失敗しました"
      redirect_to edit_condition_path(id: condition_path)
    end
  end

  def destroy
    condition = Condition.find_by(id: params[:id]).destroy
    flash[:notice] = '管理表を消しました'
    redirect_to new_pet_condition_path(pet_id: condition.pet_id)
  end

  private

  def params_condition
    params.require(:condition).permit(:vitality, :defecation, :urination, :appetite, :vomit, :weight, :comment, :staff, :recorded_at, :medicine, :recorded_date)
  end
end
