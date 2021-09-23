class BooksController < ApplicationController

 before_action :authenticate_user!


  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def new
    @book.save
    flash[:danger] = "You have created book successfully."
  end

  def show
    @book_new = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
    @user = current_user
    if @book.user == current_user
       render "edit"
    else 
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
       flash[:danger] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:danger] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private



  def book_params
    params.require(:book).permit(:title, :body)
  end
end
