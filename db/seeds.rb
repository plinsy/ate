# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include ApplicationHelper

def create_user(admin=false, user_data=[])
	data = user_data
	user = User.new(
		admin: admin,
		email: data[0],
		password: data[1],
		password_confirmation: data[1]
	)
	if user.save
		user.profile.update(
			firstname: data[2],
			lastname: data[3],
			phone: data[4]
		)
		File.open(data[5]) do |f|
			user.profile.avatar = f
		end
		user.profile.save
		print '.'
	else
		print user.errors.full_messages
	end
end

def create_category(category_data=[])
	data = category_data
	category = Category.new(
		icon: data[0],
		name: data[1]
	)
	if category.save
		print '.'
	else
		print category.errors.full_messages
	end
end

def create_tag(tag_data=[])
	data = tag_data
	category = Category.find(data[0])
	tag = data[1]
	category.tag_list.push(tag)
	if category.save
		print '.'
	else
		print 'X'
	end
end

def create_place(place_data=[])
	data = place_data
	category = categories.sample
	place = Place.new(
		user_id: data[0],
		title: data[1],
		location: data[2],
		longitude: data[3],
		latitude: data[4],
		description: data[5],
		main: data[6],
		category_id: category.id,
		tag_list: category.tag_list
	)
	if place.save
		File.open(data[7]) do |f|
			place.image = f
		end
		place.save
		print '.'
	else
		print place.errors.full_messages
	end
end

def create_service(service_data=[])
	data = service_data
	category = categories.sample
	service = Service.new(
		place_id: data[0],
		title: data[1],
		description: data[2],
		price: data[3],
		date: Faker::Date.forward,
		tag_list: category.tag_list 
	)
	if service.save
		File.open(data[4]) do |f|
			service.image = f
		end
		service.save
		print '.'
	else
		print service.errors.full_messages
	end
end

def create_comment(comment_data=[])
	data = comment_data
	comment = Comment.build_from(data[0], data[1], data[2], data[3], data[4])
	if comment.save
		print '.'
    comment.vote_by voter: User.find(data[1]), vote_scope: "review", vote_weight: rand(1..5)
	else
		print "X"
		print comment.errors.full_messages
	end
end

def create_admins
	linx = ['plinsy2@gmail.com', 'Lins#01111998', 'Princy', 'A.N.Tsimanarson', '0347739305', "/home/linx/Music/Soprano/soprano_289.jpg"]
	admins = [linx]
	admins.each do |admin|
		create_user(true, admin)
	end
	puts 'done'
end

def create_users
	users = []
	5.times { |n| users.push([Faker::Internet.email, '000000', Faker::Name.first_name_men, Faker::Name.last_name, Faker::PhoneNumber.phone_number, "#{Rails.root}/app/assets/one/img/tmp/agent-#{rand(1..5)}.jpg"])  }
	users.each do |user|
		create_user(false, user)
	end
	puts 'done'
end

def create_categories
	categories_csv_file = File.join Rails.root, 'db', 'categories.csv'
	CSV.foreach(categories_csv_file, headers: false) do |line|
		create_category(line)
	end
	puts 'done'
end

def create_tags
	tags_csv_file = File.join Rails.root, 'db', 'tags.csv'
	CSV.foreach(tags_csv_file, headers: false) do |line|
		create_tag(line)
	end
	puts 'done'
end

def create_places
	User.all.each do |user|
		places = []
		5.times { |n| 
			names = [Faker::App.name, Faker::Restaurant.name]
			descriptions = [Faker::Food.description, Faker::Restaurant.description]
			places.push(
			[
				user.id, 
				names.sample,
				Faker::Address.street_name,
				Faker::Address.longitude,
				Faker::Address.latitude,
				descriptions.sample,
				false,
				"#{Rails.root}/app/assets/one/img/tmp/product-#{rand(2..11)}.jpg",
				categories
			]
		)}
		places.each do |place|
			create_place(place)
		end
	end
	puts 'done'
end

def create_services
	Place.all.each do |place|
		services = []
		5.times { |n| 
			descriptions = [Faker::Food.description, Faker::Restaurant.description]
			services.push(
			[
				place.id, 
				Faker::Commerce.product_name,
				descriptions.sample,
				Faker::Commerce.price,
				"#{Rails.root}/app/assets/one/img/tmp/gallery-#{rand(1..8)}.jpg",
				categories
			]
		)}
		services.each do |service|
			create_service(service)
		end
	end
	puts 'done'
end

def create_comments
	Place.all.each do |place|
		comments = []
		5.times { |n| 
			comments.push(
			[
				place, 
				User.all.sample.id,
				"No comment",
				Faker::Lorem.paragraphs.join(' '),
				Faker::Lorem.paragraphs.join(' ')
			]
		)}
		comments.each do |comment|
			create_comment(comment)
		end
	end
	puts 'done'
end

puts "~> Seeding"

puts "~> Creating admins"
create_admins

puts "~> Creating users"
create_users

puts "~> Creating categories"
create_categories

puts "~> Creating tags"
create_tags

puts "~> Creating places"
create_places

puts "~> Creating services"
create_services

puts "~> Creating comments"
create_comments