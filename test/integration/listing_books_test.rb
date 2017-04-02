require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest

setup do
	@genre = Genre.create!(name: 'Fiction')
	@genre.books.create!(title: 'Pragmatic Programmer',rating: 5)
	@genre.books.create!(title: 'Learn ruby',rating: 3)	
end

 test 'listing books' do
 	get '/api/books'
 	assert_equal 200, response.status
 	assert_equal Mime::JSON,response.content_type
 	assert_equal Book.count, json(response.body).size
 end

 test 'lists top rated books' do
 	get '/api/books?rating=5'
 	assert_equal 200, response.status
 	assert_equal Mime::JSON, response.content_type

 	assert_equal 1,json(response.body).size
 end



end
