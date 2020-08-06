class ConditionsController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @condition = Condition.new
  end

  def show
  end
end
