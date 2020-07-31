class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def index
    @user = User.find(params[:user_id])
    @user_pet = @user.pets
  end

  def create
    @id = params[:user_id]
    @pet = Pet.new(params_pet)
    @pet.user_id = @id
    if @pet.save
      flash[:notice] = 'ペット情報を登録しました'
      redirect_to user_pets_path
    else
      render "new"
      flash[:danger] = 'ペット情報の登録が失敗しました'
    end
  end

  def show

  end

  def params_pet
    params.require(:pet).permit(:name, :breed, :birthday, :sex, :user_id)
  end
end
