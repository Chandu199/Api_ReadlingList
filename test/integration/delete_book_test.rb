require 'test_helper'

class DeleteBookTest < ActionDispatch::IntegrationTest
	setup do 
		@book = Book.create!(title: "Pragmatic programmer", rating: 3)
	end
	test 'delete books' do
		delete "/api/books/#{@book.id}"
		assert_equal 204, response.status
	end
end
