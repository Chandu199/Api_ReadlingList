class BooksController < ApplicationController
	def index
		books = Book.all
		if params[:rating]
			books =  Book.where(rating: params[:rating])
		end
		render json: books,status: 200
	end
end