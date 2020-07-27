class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.find_by(user_id: params[:user_id])
    raise
    @pet = Pet.new(params_pet)
    @pet.id = @pet.user_id

  
    if @pet.save
      flash[:notice] = 'ペット情報登録しました'
      redirect_to signup_path
    else
      render "new"
      flash[:danger] = '失敗しましした'
    end
  end 

  def params_pet
    params.require(:pet).permit(:name, :breed, :birthday, :sex, :user_id)
  end

end