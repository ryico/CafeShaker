class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index
    @users = User.page(params[:page]).per(3)
  end

  def show
    @user = User.includes(reviews: :place).find(params[:id])
  end

end
