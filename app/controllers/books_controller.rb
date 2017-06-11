class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def update
		@book = Book.find(params[:id])

		@book.update(favorite: !@book.favorite)

		respond_to do |format|
      format.js
    end
	end

	def allowed_params
    params.require(:feed).permit(:id)
  end
end
