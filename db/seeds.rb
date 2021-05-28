# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all
Board.destroy_all
User.destroy_all


puts "Formulating Kai's"

20.times do 
    User.create(username: Faker::Name.first_name, password: "1234")
end

puts "Assembling Squads"

5.times do
    Team.create(leader_id: User.all.sample.id, name: Faker::Cannabis.strain, description: "lmao" )
end

puts "Assembling Avengers"

20.times do
    TeamMember.create(team_id: Team.all.sample.id, member_id: User.all.sample.id)
end

puts "Creating Boards"

40.times do
    Board.create(title: Faker::Movies::HarryPotter.spell, owner: User.all.sample, description: Faker::Movies::HarryPotter.quote)
end

40.times do
    Board.create(title: Faker::Movies::HarryPotter.spell, owner: Team.all.sample, description: Faker::Movies::HarryPotter.quote)
end

puts "Making Tasks"

status = ["open", "in-progress", "review", "completed"]

300.times do 
    Task.create(title: Faker::Movies::HarryPotter.spell, board: Board.all.sample, description: Faker::Movies::HarryPotter.quote, due_date: "2021-06-29", status: status.sample)
end

