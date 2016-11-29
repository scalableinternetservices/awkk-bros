# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

number_of_users = 100
number_of_events = 20
user_base_number = 100000
user_iter = 0
event_iter = 0
# number_of_comments = ...

#create users
while user_iter < number_of_users
    user = User.new
    currUser = (user_base_number + user_iter).to_s
    user.username = currUser 
    user.email = Random.new.rand(1.0).to_s + "@gmail.com"
    user.password = currUser
    user.password_confirmation = currUser 
    user.save!
    user_iter += 1
end

#create events
x = 0 # please make sure that the number of users is greater than number of events to be created

while event_iter < number_of_events
    currUser = (user_base_number + x).to_s

    if event_iter >= number_of_users
        currUser = (user_base_number + (number_of_events - 1) ).to_s
    end

    litEvent = Event.new

    if event_iter >= number_of_users
        litEvent.user_id = number_of_users 
    else
        litEvent.user_id = x + 1
    end

    litEvent.name = currUser + "'s lit event"
    litEvent.location = currUser +"'s lit place"
    litEvent.description = "it's lit" 
    litEvent.save!
    x += 1
    event_iter += 1
end

