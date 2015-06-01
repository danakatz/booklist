todayStr = Date.today.strftime("%Y-%m-%d")
current_data = JSON.parse(open("http://api.nytimes.com/svc/books/v3/lists/#{todayStr}/combined-print-and-e-book-fiction.json?api-key=109b53e7b968c68be785cd9deb96d603%3A5%3A61185311").read)

# Old data for Archive page
old_data_1 = JSON.parse(open("db/2015-04-18.json").read)
old_data_2 = JSON.parse(open("db/2015-04-25.json").read)
old_data_3 = JSON.parse(open("db/2015-05-02.json").read)

all_data = [old_data_1, old_data_2, old_data_3, current_data]

# Populate Book and Author models
all_data.each do |data|
  data["results"]["books"].each do |book_hash|
    book = Book.find_by(title: book_hash['title'])
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
      book.reviewed = book_hash['book_review_link'].present? || book_hash['sunday_review_link'].present?
      book.save
    end
    book.rank = book_hash['rank'].to_i
    book.current = false
    book.save
  end
end

current_data["results"]["books"].each do |book_hash|
  book = Book.find_by(title: book_hash['title'])
  book.current = true
  book.save
end

# Populate Review and Reviewer models
Book.where(reviewed: true).each do |book|
  review_data = JSON.parse(open("http://api.nytimes.com/svc/books/v3/reviews.json?isbn=#{book.isbn}&api-key=109b53e7b968c68be785cd9deb96d603%3A5%3A61185311").read)

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
      review.book_id = book.id
      review.url = review_hash['url']
      review.publish_date = Date.parse(review_hash['publication_dt'])
      review.save
    end
  end
end

puts 'Seeded successfully!'