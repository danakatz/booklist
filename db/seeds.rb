User.find_or_create_by name: "Dana Katz"

Book.all.each do |book|
	book.current = false
	book.save
end

todayStr = Date.today.strftime("%Y-%m-%d")
nyt_data = JSON.parse(open("http://api.nytimes.com/svc/books/v3/lists/#{todayStr}/combined-print-and-e-book-fiction.json?api-key=109b53e7b968c68be785cd9deb96d603%3A5%3A61185311").read)

nyt_data["results"]["books"].each do |book_hash|
	book = Book.find_by(isbn: book_hash['primary_isbn13'])
	author = Author.find_by(name: book_hash['author'])
	if author == nil
		author = Author.new
		author.name = book_hash['author']
		author.save
	end
	if book == nil 
		book = Book.new
		book.title = book_hash['title']
		book.author_id = author.id
		book.description = book_hash['description']
		book.isbn = book_hash['primary_isbn13']
		book.image_url = book_hash['book_image']
		book.amazon_url = book_hash['amazon_product_url']
		book.reviewed = false
		book.save
	end
	book.rank = book_hash['rank'].to_i
	book.current = true
	book.save
end

Book.all.each do |book|
	review_data = JSON.parse(open("http://api.nytimes.com/svc/books/v3/reviews.json?isbn=#{book.isbn}&api-key=109b53e7b968c68be785cd9deb96d603%3A5%3A61185311").read)
	if review_data['num_results'].to_i > 0
		book.reviewed = true
		book.save
	end

	review_data['results'].each do |review_hash|
		reviewer = Reviewer.find_by(name: review_hash['byline'])
		if reviewer == nil
			reviewer = Reviewer.new
			reviewer.name = review_hash['byline']
			reviewer.save
		end
		review = Review.where(title: review_hash['book_title'], reviewer_id: reviewer.id)
		if !review.present?
			review = Review.new
			review.title = review_hash['book_title']
			review.blurb = review_hash['summary']
			review.reviewer_id = reviewer.id
			review.publication_id = Publication.find_by(name: 'New York Times').id
			review.book_id = book.id
			review.url = review_hash['url']
			review.publish_date = Date.parse(review_hash['publication_dt'])
			review.save
		end
	end
end

# Book.all.each do |book|
# 	searchTitle = book.title.tr(' ', '+')
# 	puts "USA Today review for #{searchTitle}"
# 	review_data = JSON.parse(open("http://api.usatoday.com/open/reviews/books/book/#{searchTitle}?encoding=json&api_key=5gjphcgkmmqnt6d8hg2rn6ph").read)
# 	review_data['BookReviews'].each do |review_hash|
# 		reviewer = Reviewer.find_by(name: review_hash['Reviewer'])
# 		if reviewer == nil 
# 			reviewer = Reviewer.new
# 			reviewer.name = review_hash['Reviewer']
# 			reviewer.save
# 		end
# 		review = Review.where(title: review_hash['Title'], reviewer_id: reviewer.id)
# 		if !review.present?
# 			review = Review.new
# 			review.title = book.title
# 			review.blurb = review_hash['Brief']
# 			review.reviewer_id = reviewer.id
# 			review.publication_id = Publication.find_by(name: 'USA Today').id
# 			review.book_id = book.id
# 			review.url = review_hash['ReviewUrl']
# 			review.publish_date = Date.strptime(review_hash['ReviewDate'], '%m/%d/%Y')
# 			review.save
# 			puts 'saved review'
# 		end
# 	end
# end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
