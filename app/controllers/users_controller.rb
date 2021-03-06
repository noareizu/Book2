class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end
  def edit
    @user = User.find(params[:id])
    @book = Book.new
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def index
    @user = User.all
    @newbook = Book.new
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "successfully"
  	   redirect_to user_path(@user.id)
    else
       render 'edit'
     end
  end

  private
  def user_params
  	params.require(:user).permit(:name,:introduction,:profile_image)
  end
  def book_params
      params.require(:book).permit(:title, :body)
  end

end
