require 'test_helper'

class CreatingBookTest < ActionDispatch::IntegrationTest

	test 'Create books with valid data' do
		post '/books',{book: {
			title: 'Pragmatic Programmer',
			rating: 3,
			author: "Dave thomas",
			genre_id: 1,
			review: "An Awesome book.",
			amazon_id: "12344"

			}}.to_json,
			{'Accept' =>'application/json','Content-Type'=>'application/json'}
		assert_equal 201,response.status
		assert_equal Mime::JSON,response.content_type
		book = json(response.body)
		assert_equal book_url(book[:id]),response.location
		assert_equal 'Pragmatic Programmer', book[:title]
		assert_equal 3, book[:rating]
		assert_equal 'Dave thomas', book[:author]
		assert_equal 1, book[:genre_id]
		assert_equal 'An Awesome book.', book[:review]
		assert_equal "12344", book[:amazon_id]

	end

	test 'Create books with invalid data' do
		post '/books',{book: {
			title: nil,
			rating: 3,
			}}.to_json,
			{'Accept' =>'application/json','Content-Type'=>'application/json'}
		assert_equal 422,response.status
	end

end
