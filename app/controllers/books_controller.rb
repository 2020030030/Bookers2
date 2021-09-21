class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to books_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
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
