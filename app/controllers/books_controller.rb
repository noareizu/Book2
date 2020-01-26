class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:index,:show,:edit,:create,:update,:destroy]
	def index
		@books = Book.all
		@book = Book.new
		@user = User.all
	end

	def show
		@user = User.all
		@books = Book.all
		@book = Book.find(params[:id])
		@newbook = Book.new
	end

	def edit
		@book = Book.find(params[:id])
		if current_user != @book.user
			redirect_to books_path
		end
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "successfully"
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			render 'index'
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "successfully"
			redirect_to book_path(@book.id)
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def user_params
		params.require(:user).permit(:name,:introduction,:profile_image)
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
