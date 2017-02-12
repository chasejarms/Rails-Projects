class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
    Book.create(book_params)
    redirect_to :books
  end

  def destroy
    # your code here
    # Using ActiveRecord, find the book in question,
    # delete it, and redirect_to the index page.
    book_in_question = Book.find(params[:id]).destroy
    redirect_to :books
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
