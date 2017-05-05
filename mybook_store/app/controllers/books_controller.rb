class BooksController < ApplicationController
  before_action :find_books, only: [:show, :edit, :update]
  def index
    @books = Book.all
  end
  def show
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
  def edit
  end
  
  def update
      if @book.update(book_params)
        redirect_to books_path, notice: "資料更新成功!"
      else
        render :edit
      end
  end
  def book_params
    params.require(:book).permit(:name, :introduction, :writer_name, :price)
  end
  
  def find_books
    @book = Book.find_by(id: params[:id])
  end
end
