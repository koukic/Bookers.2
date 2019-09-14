class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :correct_user, only: [:edit, :update]
  def show
    @books = Book.all
    @book =  Book.new
    
  end

  def edit
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  
  def update
    if @user.update(user_params)
      flash[:notice] = 'successfully'
      redirect_to user_path(@user.id)
    else
      flash.now[:notice] = 'error'
      render :edit
    end
  end
  

  private
  def correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end
    
      
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
