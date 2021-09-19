class BooksController < ApplicationController

  def index
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(params)
    book.save
    redirect_to post_image_book(id)

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
