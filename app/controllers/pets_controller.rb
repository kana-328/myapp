class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def index
    @user = User.find(params[:user_id])
    @pets = @user.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @id = params[:user_id]
    @pet = Pet.new(params_pet)
    @pet.user_id = @id
    if @pet.save
      flash[:notice] = 'ペット情報を登録しました'
      redirect_to user_pets_path
    else
      @condition = Pet.new(params_pet)
      render "new"
      flash[:danger] = 'ペット情報の登録が失敗しました'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(params_pet)
      flash[:notice] = 'ペット情報を更新しました'
      redirect_to user_pets_path(user_id: @pet.user_id)
    else
      flash[:notice] = '失敗しました'
      edit_pet_path(id: @pet.id)
    end
  end

  def destroy
    pet = Pet.find_by(id: params[:id]).destroy
    flash[:notice] = 'ペットを消しました'
    redirect_to user_pets_path(user_id: pet.user_id)
  end

  private

  def params_pet
    params.require(:pet).permit(:name, :breed, :birthday, :sex, :user_id)
  end
end
