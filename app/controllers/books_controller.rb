class BooksController < ApplicationController
  def new
   @book = Book.new
  end

  def create
   book = Book.new(book_params)
   book.save
   redirect_to post_images
  end

  def index
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
