class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update, :destroy, :edit ]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def my_portfolio
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @appointments = Appointment.find_by(user_id: params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
