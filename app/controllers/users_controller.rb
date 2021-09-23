class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @book_new = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    if @user == current_user
       render "edit"
    else
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:danger] = "You have created book successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
