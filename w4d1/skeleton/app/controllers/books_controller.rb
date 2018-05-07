class BooksController < ApplicationController
  def index
    # your code here
    render json: Book.all
  end

  def new
    # your code here
    render :new
  end

  def create
    # your code here
    book = Book.new(book_params)
    if book.save
      render json: book
    else
      render json: superhero.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # your code here
    book = Book.find_by(id: params[:id])
    book.destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
