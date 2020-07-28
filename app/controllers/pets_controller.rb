class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @id = params[:user_id]
    @pet = Pet.new(params_pet)
    @pet.user_id = @id
    if @pet.save
      flash[:notice] = 'ペット情報登録しました'
      redirect_to user_pet_path(id: @pet.id)
    else
      render "new"
      flash[:danger] = '失敗しましした'
    end
  end

  def show
  end

  def params_pet
    params.require(:pet).permit(:name, :breed, :birthday, :sex, :user_id)
  end
end
