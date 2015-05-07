Publication.delete_all
Section.delete_all
Author.delete_all
Article.delete_all

Publication.create 	name: "New York Times",
					url: "http://www.nytimes.com"


Publication.create 	name: "USA Today",
					url: "http://www.usatoday.com"


Section.create 	name: "Technology",
				publication_id: Publication.find_by(name: "New York Times").id

Section.create 	name: "Travel",
				publication_id: Publication.find_by(name: "USA Today").id


Author.create 	first_name: "Farhad",
				last_name: "Manjoo"

Author.create 	first_name: "Carrie",
				last_name: "Wilbanks"

Article.create 	title: "Instacart’s Bet on Online Grocery Shopping",
				author_id: Author.find_by(first_name: "Farhad", last_name: "Manjoo").id,
				publication_id: Publication.find_by(name: "New York Times").id,
				section_id: Section.find_by(name: "Technology"),	
				url: "http://www.nytimes.com/2015/04/30/technology/personaltech/instacarts-bet-on-online-grocery-shopping.html?rref=collection%2Fcolumn%2Fstate-of-the-art",
				publish_date: Date.parse('2015-04-29')

Article.create 	title: "10 restaurants not reachable by car",
				author_id: Author.find_by(first_name: "Carrie", last_name: "Wilbanks").id,
				publication_id: Publication.find_by(name: "USA Today").id,
				section_id: Section.find_by(name: "Travel"),	
				url: "http://experience.usatoday.com/food-and-wine/story/best-of-food-and-wine/2015/04/14/remote-restaurants-not-reachable-by-car/25729083/",
				publish_date: Date.parse('2015-04-14')

User.create 	name: "Dana Katz"



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
