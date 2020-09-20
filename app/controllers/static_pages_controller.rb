class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :introduce]
  def index
  end

  def show
  end

  def introduce
  end
end
