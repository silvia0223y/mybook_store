class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
      if @book.save
        redirect_to books_path, notice: "新增書本成功!"
      else
        render :new
      end
  end
  
  private
  def book_params
    params.require(:book).permit(:name, :introduction, :writer_name, :price)
  end
end
