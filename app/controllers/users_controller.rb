class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def my_portfolio
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
