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
		print '.'
	else
		print user.errors.full_messages
	end
end

def create_place(place_data=[])
	data = place_data
	place = Place.new(
		user_id: data[0],
		title: data[1],
		location: data[2],
		longitude: data[3],
		latitude: data[4],
		description: data[5],
		main: data[6],
		image: data[7],
		activity_list: data[8]
	)
	if place.save
		print '.'
	else
		print place.errors.full_messages
	end
end

def create_service(service_data=[])
	data = service_data
	service = Service.new(
		place_id: data[0],
		title: data[1],
		description: data[2],
		price: data[3],
		image: data[4],
		category_list: data[5]
	)
	if service.save
		print '.'
	else
		print service.errors.full_messages
	end
end

def create_admins
	linx = ['plinsy2@gmail.com', 'Lins#01111998', 'Princy', 'A.N.Tsimanarson', '0347739305']
	admins = [linx]
	admins.each do |admin|
		create_user(true, admin)
	end
	puts 'done'
end

def create_users
	users = []
	10.times { |n| users.push([Faker::Internet.email, '000000', Faker::Name.first_name_men, Faker::Name.last_name, Faker::PhoneNumber.phone_number])  }
	users.each do |user|
		create_user(false, user)
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
				Faker::Placeholdit.image,
				activities
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
				Faker::Placeholdit.image,
				categories
			]
		)}
		services.each do |service|
			create_service(service)
		end
	end
	puts 'done'
end

puts "~> Seeding"

puts "~> Creating admins"
create_admins

puts "~> Creating users"
create_users

puts "~> Creating places"
create_places

puts "~> Creating services"
create_services