class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  # # def new
  # # end

  # def create
  #   users.create(users_params)
  #   render template: users_path
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
