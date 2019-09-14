class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :destroy,:show]
  before_action :correct_book, only: [:edit, :update]
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    
  end
  
  def show
    @user_book = Book.new
    @user = @book.user
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'successfully'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      flash[:notice] = "error"
      render "index"
    end
  end
  
  def edit
  end
  
  def update
    if @book.update(book_params)
      flash[:notice] = 'successfully'
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = 'error'
      render :edit
    end
  end
  
  def destroy
    @book.destroy

    flash[:notice] = 'succesfully'
    redirect_to books_path
  end
    
    
  
  
        
  
  private
  def correct_book
    @book = current_user.books.find_by(id: params[:id])
      unless @book
        redirect_to books_path
      end
  end
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
