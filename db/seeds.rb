# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_user(admin=false, user_data=[])
	data = user_data
	user = User.new(
		email: data[0],
		password: data[1],
		password_confirmation: data[1]
	)
	if user.save
		print '.'
	else
		print user.errors.full_messages
	end
end

def create_activity(data=[])
	activity = Activity.new(
		name: data[0]
	)
	if activity.save
		print '.'
	else
		print activity.errors.full_messages
	end
end

def create_admins
	linx = ['plinsy2@gmail.com', 'Lins#01111998']
	admins = [linx]
	admins.each do |admin|
		create_user(true, admin)
	end
	puts 'done'
end

def create_activities
	activities = [
		["Personal activity"],
		["Hospital"],
		["School"],
		["Bus stop"],
		["Hotel"],
		["Restaurant"],
		["Coffee"],
		["Cyber"],
		["Pub"],
		["Airport"]
	]
	activities.each do |activity|
		create_activity(activity)
	end
	puts 'done'
end

puts "~> Seeding"

puts "~> Creating admins"
create_admins

puts "~> Creating activities"
create_activities